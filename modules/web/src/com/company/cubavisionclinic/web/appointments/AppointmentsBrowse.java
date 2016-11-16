/*
 * Copyright (c) 2008-2016 Haulmont.
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

package com.company.cubavisionclinic.web.appointments;

import com.company.cubavisionclinic.entity.Appointments;
import com.haulmont.cuba.core.entity.Entity;
import com.haulmont.cuba.gui.components.*;
import com.haulmont.cuba.gui.components.actions.CreateAction;
import com.haulmont.cuba.gui.components.actions.EditAction;
import com.haulmont.cuba.gui.components.actions.RemoveAction;
import com.haulmont.cuba.gui.data.CollectionDatasource;
import com.haulmont.cuba.gui.data.DataSupplier;
import com.haulmont.cuba.gui.data.Datasource;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.Collections;
import java.util.Map;
import java.util.UUID;
import com.haulmont.cuba.core.entity.IdProxy;

public class AppointmentsBrowse extends AbstractLookup {

    @Inject
    private CollectionDatasource<Appointments, IdProxy> appointmentsesDs;

    @Inject
    private Datasource<Appointments> appointmentsDs;

    @Inject
    private Table<Appointments> appointmentsesTable;

    @Inject
    private BoxLayout lookupBox;

    @Inject
    private BoxLayout actionsPane;

    @Inject
    private FieldGroup fieldGroup;
    
    @Named("appointmentsesTable.remove")
    private RemoveAction appointmentsesTableRemove;
    
    @Inject
    private DataSupplier dataSupplier;

    private boolean creating;

    @Override
    public void init(Map<String, Object> params) {
        appointmentsesDs.addItemChangeListener(e -> {
            if (e.getItem() != null) {
                Appointments reloadedItem = dataSupplier.reload(e.getDs().getItem(), appointmentsDs.getView());
                appointmentsDs.setItem(reloadedItem);
            }
        });
        
        appointmentsesTable.addAction(new CreateAction(appointmentsesTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity newItem, Datasource parentDs, Map<String, Object> params) {
                appointmentsesTable.setSelected(Collections.emptyList());
                appointmentsDs.setItem((Appointments) newItem);
                enableEditControls(true);
            }
        });

        appointmentsesTable.addAction(new EditAction(appointmentsesTable) {
            @Override
            protected void internalOpenEditor(CollectionDatasource datasource, Entity existingItem, Datasource parentDs, Map<String, Object> params) {
                if (appointmentsesTable.getSelected().size() == 1) {
                    enableEditControls(false);
                }
            }
        });
        
        appointmentsesTableRemove.setAfterRemoveHandler(removedItems -> appointmentsDs.setItem(null));
        
        disableEditControls();
    }

    public void save() {
        getDsContext().commit();

        Appointments editedItem = appointmentsDs.getItem();
        if (creating) {
            appointmentsesDs.includeItem(editedItem);
        } else {
            appointmentsesDs.updateItem(editedItem);
        }
        appointmentsesTable.setSelected(editedItem);

        disableEditControls();
    }

    public void cancel() {
        Appointments selectedItem = appointmentsesDs.getItem();
        if (selectedItem != null) {
            Appointments reloadedItem = dataSupplier.reload(selectedItem, appointmentsDs.getView());
            appointmentsesDs.setItem(reloadedItem);
        } else {
            appointmentsDs.setItem(null);
        }

        disableEditControls();
    }

    private void enableEditControls(boolean creating) {
        this.creating = creating;
        initEditComponents(true);
        fieldGroup.requestFocus();
    }

    private void disableEditControls() {
        initEditComponents(false);
        appointmentsesTable.requestFocus();
    }

    private void initEditComponents(boolean enabled) {
        fieldGroup.setEditable(enabled);
        actionsPane.setVisible(enabled);
        lookupBox.setEnabled(!enabled);
    }
}