package com.company.cubavisionclinic.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.AttributeOverrides;
import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import com.haulmont.cuba.core.global.DesignSupport;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.haulmont.cuba.core.entity.BaseIdentityIdEntity;
import com.haulmont.chile.core.annotations.NamePattern;

@NamePattern("%s|rebate")
@DesignSupport("{'imported':true}")
@AttributeOverrides({
        @AttributeOverride(name = "id", column = @Column(name = "ProductRebateID"))
})
@Table(name = "ProductRebate")
@Entity(name = "cubavisionclinic$ProductRebate")
public class ProductRebate extends BaseIdentityIdEntity {
    private static final long serialVersionUID = 7224970726245595229L;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ProductID")
    protected Product productID;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "RebateStart")
    protected Date rebateStart;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "RebateEnd")
    protected Date rebateEnd;

    @Column(name = "Rebate", precision = 19, scale = 4)
    protected BigDecimal rebate;

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    public Product getProductID() {
        return productID;
    }

    public void setRebateStart(Date rebateStart) {
        this.rebateStart = rebateStart;
    }

    public Date getRebateStart() {
        return rebateStart;
    }

    public void setRebateEnd(Date rebateEnd) {
        this.rebateEnd = rebateEnd;
    }

    public Date getRebateEnd() {
        return rebateEnd;
    }

    public void setRebate(BigDecimal rebate) {
        this.rebate = rebate;
    }

    public BigDecimal getRebate() {
        return rebate;
    }


}