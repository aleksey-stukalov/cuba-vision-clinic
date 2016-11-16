package com.company.cubavisionclinic.web.invoicedetails;

import com.company.cubavisionclinic.entity.InvoiceDetails;
import com.company.cubavisionclinic.entity.Product;
import com.haulmont.cuba.gui.components.AbstractEditor;
import com.haulmont.cuba.gui.components.PickerField;
import com.haulmont.cuba.gui.data.DataSupplier;
import com.haulmont.cuba.gui.data.Datasource;

import javax.inject.Inject;
import javax.inject.Named;

public class InvoiceDetailsEdit extends AbstractEditor<InvoiceDetails> {

    @Inject
    private DataSupplier dataSupplier;

    @Inject
    private Datasource<InvoiceDetails> invoiceDetailsDs;

    @Named("fieldGroup.productProductid")
    private PickerField productProductidField;

    @Override
    protected void postInit() {
        super.postInit();

        productProductidField.addValueChangeListener(e -> {
            Product selectedProduct = getItem().getProductProductid();
            if (selectedProduct != null) {
                selectedProduct = dataSupplier.reload(selectedProduct, "product-current-price-view");
                getItem().setUnitPrice(selectedProduct.getCurrentPrice());
            } else
                getItem().setUnitPrice(null);
        });
    }
}