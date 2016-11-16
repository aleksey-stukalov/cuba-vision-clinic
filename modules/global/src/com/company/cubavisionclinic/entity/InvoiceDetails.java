package com.company.cubavisionclinic.entity;

import com.haulmont.chile.core.annotations.MetaProperty;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.BaseIdentityIdEntity;
import com.haulmont.cuba.core.entity.Creatable;
import com.haulmont.cuba.core.entity.Updatable;
import com.haulmont.cuba.core.global.DesignSupport;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@NamePattern("%s x%s|productProductid,quantity")
@DesignSupport("{'imported':true,'unmappedColumns':['RowVersion']}")
@Table(name = "InvoiceDetails")
@Entity(name = "cubavisionclinic$InvoiceDetails")
public class InvoiceDetails extends BaseIdentityIdEntity implements Updatable, Creatable {
    private static final long serialVersionUID = 2570336728900159710L;

    @Column(name = "Quantity", nullable = false)
    protected Integer quantity;

    @Column(name = "UnitPrice", nullable = false, precision = 18, scale = 2)
    protected BigDecimal unitPrice;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Product_ProductID")
    protected Product productProductid;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Invoice_InvoiceDetail")
    protected Invoices invoiceInvoicedetail;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Created")
    protected Date createTs;

    @Column(name = "CreatedBy")
    protected String createdBy;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Modified")
    protected Date updateTs;

    @Column(name = "ModifiedBy")
    protected String updatedBy;

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setProductProductid(Product productProductid) {
        this.productProductid = productProductid;
    }

    public Product getProductProductid() {
        return productProductid;
    }

    public void setInvoiceInvoicedetail(Invoices invoiceInvoicedetail) {
        this.invoiceInvoicedetail = invoiceInvoicedetail;
    }

    @MetaProperty(related = "quantity,unitPrice")
    public BigDecimal getSubTotal() {
        if (quantity == null || unitPrice == null)
            return null;

        return unitPrice.multiply(new BigDecimal(quantity));
    }

    public Invoices getInvoiceInvoicedetail() {
        return invoiceInvoicedetail;
    }

    @Override
    public void setCreateTs(Date createTs) {
        this.createTs = createTs;
    }

    @Override
    public Date getCreateTs() {
        return createTs;
    }

    @Override
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String getCreatedBy() {
        return createdBy;
    }

    @Override
    public void setUpdateTs(Date updateTs) {
        this.updateTs = updateTs;
    }

    @Override
    public Date getUpdateTs() {
        return updateTs;
    }

    @Override
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String getUpdatedBy() {
        return updatedBy;
    }


}