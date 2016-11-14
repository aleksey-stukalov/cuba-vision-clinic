package com.company.cubavisionclinic.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.haulmont.cuba.core.global.DesignSupport;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.haulmont.cuba.core.entity.BaseIdentityIdEntity;
import com.haulmont.cuba.core.entity.Updatable;
import com.haulmont.cuba.core.entity.Creatable;
import com.haulmont.chile.core.annotations.Composition;
import java.util.Set;
import javax.persistence.OneToMany;
import com.haulmont.chile.core.annotations.NamePattern;

@NamePattern("%s - %s|id,invoiceDate")
@DesignSupport("{'imported':true,'unmappedColumns':['RowVersion']}")
@Table(name = "Invoices")
@Entity(name = "cubavisionclinic$Invoices")
public class Invoices extends BaseIdentityIdEntity implements Updatable, Creatable {
    private static final long serialVersionUID = -5391140617706280276L;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "InvoiceDate", nullable = false)
    protected Date invoiceDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "InvoiceDue", nullable = false)
    protected Date invoiceDue;

    @Column(name = "InvoiceStatus", nullable = false)
    protected Integer invoiceStatus;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ShipDate", nullable = false)
    protected Date shipDate;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Invoice_Patient")
    protected Patients invoicePatient;

    @Composition
    @OneToMany(mappedBy = "invoiceInvoicedetail")
    protected Set<InvoiceDetails> details;

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

    public void setDetails(Set<InvoiceDetails> details) {
        this.details = details;
    }

    public Set<InvoiceDetails> getDetails() {
        return details;
    }


    public InvoiceStatus getInvoiceStatus() {
        return invoiceStatus == null ? null : InvoiceStatus.fromId(invoiceStatus);
    }

    public void setInvoiceStatus(InvoiceStatus invoiceStatus) {
        this.invoiceStatus = invoiceStatus == null ? null : invoiceStatus.getId();
    }


    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDue(Date invoiceDue) {
        this.invoiceDue = invoiceDue;
    }

    public Date getInvoiceDue() {
        return invoiceDue;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setInvoicePatient(Patients invoicePatient) {
        this.invoicePatient = invoicePatient;
    }

    public Patients getInvoicePatient() {
        return invoicePatient;
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