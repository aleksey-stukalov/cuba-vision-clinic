/*
 * Copyright Haulmont
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.company.cubavisionclinic.web.product;

import com.company.cubavisionclinic.entity.Product;
import com.haulmont.cuba.core.entity.Entity;
import com.haulmont.cuba.core.entity.IdProxy;
import com.haulmont.cuba.gui.ComponentsHelper;
import com.haulmont.cuba.gui.components.*;
import com.haulmont.cuba.gui.components.actions.CreateAction;
import com.haulmont.cuba.gui.components.actions.EditAction;
import com.haulmont.cuba.gui.components.actions.RemoveAction;
import com.haulmont.cuba.gui.data.CollectionDatasource;
import com.haulmont.cuba.gui.data.DataSupplier;
import com.haulmont.cuba.gui.data.Datasource;
import com.haulmont.cuba.gui.xml.layout.ComponentsFactory;
import org.apache.commons.compress.utils.IOUtils;
import org.slf4j.Logger;

import javax.annotation.Nullable;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

public class ProductBrowse extends AbstractLookup {

    private static final String IMAGE_CELL_HEIGHT = "150px";

    @Inject
    private CollectionDatasource<Product, IdProxy> productsDs;

    @Inject
    private Datasource<Product> productDs;

    @Inject
    private Table<Product> productsTable;

    @Inject
    private BoxLayout lookupBox;

    @Inject
    private BoxLayout actionsPane;

    @Inject
    private FieldGroup fieldGroup;

    @Inject
    private TabSheet tabSheet;

    @Named("productsTable.remove")
    private RemoveAction productsTableRemove;

    @Inject
    private DataSupplier dataSupplier;

    @Inject
    private ComponentsFactory componentsFactory;

    @Inject
    private Embedded productImage;

    @Inject
    private FileUploadField imageUpload;

    @Inject
    private Logger log;

    private boolean creating;

    @Override
    public void init(Map<String, Object> params) {

        productsDs.addItemChangeListener(e -> {
            if (e.getItem() != null) {
                Product reloadedItem = dataSupplier.reload(e.getDs().getItem(), productDs.getView());
                productDs.setItem(reloadedItem);

                /**
                 * update image in the {@link ProductBrowse#productImage} component if selected {@link Product} is changed
                 */
                generateImage(productDs.getItem(), null, productImage);
            }
        });

        productsTable.addAction(new CreateAction(productsTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity newItem, Datasource parentDs, Map<String, Object> params) {
                productsTable.setSelected(Collections.emptyList());
                productDs.setItem((Product) newItem);
                enableEditControls(true);
                productImage.resetSource();
            }
        });

        productsTable.addAction(new EditAction(productsTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity existingItem, Datasource parentDs, Map<String, Object> params) {
                if (productsTable.getSelected().size() == 1) {
                    enableEditControls(false);
                }
            }
        });

        /**
         * Listener updates the {@link Product#productImage} field after file has been successfully uploaded
         */
        imageUpload.addFileUploadSucceedListener(event -> {
            Product product = productDs.getItem();
            if (product != null && imageUpload.getFileContent() != null) {
                try {
                    product.setProductImage(IOUtils.toByteArray(imageUpload.getFileContent()));
                    generateImage(product, null, productImage);
                } catch (IOException e) {
                    log.error("Error happened while converting content of upload filed to byte array", e);
                    showNotification(getMessage("fileUploadErrorMessage"), NotificationType.ERROR);
                }
            }
            imageUpload.setValue(null);
        });

        /**
         * Handles the clear button clicked event, asking for action confirmation
         * and clearing the {@link Product#productImage} field if confirmed
         */
        imageUpload.addBeforeValueClearListener(beforeEvent -> {
            beforeEvent.preventClearAction();
            showOptionDialog("", "Are you sure you want to delete this photo?", MessageType.CONFIRMATION,
                    new Action[]{
                            new DialogAction(DialogAction.Type.YES, Action.Status.PRIMARY) {
                                public void actionPerform(Component component) {
                                    productDs.getItem().setProductImage(null);
                                    productImage.resetSource();
                                }
                            },
                            new DialogAction(DialogAction.Type.NO, Action.Status.NORMAL)
                    });
        });

        productsTableRemove.setAfterRemoveHandler(removedItems -> productDs.setItem(null));

        /**
         * Hides the default image when screen is just opened
         */
        productImage.resetSource();

        disableEditControls();
    }

    public void save() {
        getDsContext().commit();

        Product editedItem = productDs.getItem();
        if (creating) {
            productsDs.includeItem(editedItem);
        } else {
            productsDs.updateItem(editedItem);
        }
        productsTable.setSelected(editedItem);

        disableEditControls();
    }

    public void cancel() {
        Product selectedItem = productsDs.getItem();
        if (selectedItem != null) {
            Product reloadedItem = dataSupplier.reload(selectedItem, productDs.getView());
            productsDs.setItem(reloadedItem);
        } else {
            productDs.setItem(null);
        }

        disableEditControls();

        /**
         * regenerate {@link productImage} when cancelling edit action
         */
        generateImage(selectedItem, null, productImage);
    }

    private void enableEditControls(boolean creating) {
        this.creating = creating;
        initEditComponents(true);
        fieldGroup.requestFocus();
    }

    private void disableEditControls() {
        initEditComponents(false);
        productsTable.requestFocus();
    }

    private void initEditComponents(boolean enabled) {
        ComponentsHelper.walkComponents(tabSheet, (component, name) -> {
            if (component instanceof FieldGroup) {
                ((FieldGroup) component).setEditable(enabled);
            } else if (component instanceof Table) {
                ((Table) component).getActions().stream().forEach(action -> action.setEnabled(enabled));
            }
        });
        actionsPane.setVisible(enabled);
        lookupBox.setEnabled(!enabled);

        /**
         * Enabling/disabling file upload control, depending if the screen is in editing mode or not
         */
        imageUpload.setVisible(enabled);
    }

    /**
     * Method is used in the screen descriptor for generating component
     * in the productImage column of the relatedProductsTable
     *
     * @param entity Instance that is represented in the row
     * @return The {@link Component} instance to be placed in the cell
     */
    public Component generateProductImageCell(Product entity) {
        return generateImage(entity, IMAGE_CELL_HEIGHT, null);
    }

    /**
     * Generates or updates visual representation for {@link Product#productImage}
     *
     * @param product Instance of the {@link Product} entity, which image should be displayed
     * @param height Is set to the returned {@link Embedded} instance if not null
     * @param displayComponent Existing {@link Embedded} component, used to display an image
     *                         <p/>If null - method will return a newly created instance
     * @return The {@link Embedded} instance that shows image, stored as array of bytes in {@link Product#productImage}
     */
    @Nullable
    private Embedded generateImage(Product product, String height, Embedded displayComponent) {
        if (product == null || product.getProductImage() == null) {
            if (displayComponent != null)
                displayComponent.resetSource();
            return null;
        }

        Embedded embedded = displayComponent;
        if (embedded == null)
            embedded = (Embedded) componentsFactory.createComponent(Embedded.NAME);

        embedded.setSource("productImage", new ByteArrayInputStream(product.getProductImage()));
        if (height != null)
            embedded.setHeight(height);

        return embedded;
    }
}