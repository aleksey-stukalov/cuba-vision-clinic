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

package com.company.cubavisionclinic.entity;

import com.haulmont.chile.core.annotations.Composition;
import com.haulmont.chile.core.annotations.MetaProperty;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.BaseIdentityIdEntity;
import com.haulmont.cuba.core.global.DesignSupport;
import com.haulmont.cuba.core.global.PersistenceHelper;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@DesignSupport("{'imported':true}")
@AttributeOverrides({
        @AttributeOverride(name = "id", column = @Column(name = "ProductID"))
})
@NamePattern("%s|productName")
@Table(name = "Product")
@Entity(name = "cubavisionclinic$Product")
public class Product extends BaseIdentityIdEntity {
    private static final long serialVersionUID = 6459017363675748947L;

    @Column(name = "ProductName", nullable = false, length = 50)
    protected String productName;

    @Column(name = "MSRP", nullable = false, precision = 19, scale = 4)
    protected BigDecimal msrp;

    @Lob
    @Column(name = "Description")
    protected String description;

    @Column(name = "ProductImage")
    protected byte[] productImage;

    @Lob
    @Column(name = "Category")
    protected String category;

    @Composition
    @OneToMany(mappedBy = "productID")
    protected Set<ProductRebate> rebates;

    public void setRebates(Set<ProductRebate> rebates) {
        this.rebates = rebates;
    }

    public Set<ProductRebate> getRebates() {
        return rebates;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setMsrp(BigDecimal msrp) {
        this.msrp = msrp;
    }

    public BigDecimal getMsrp() {
        return msrp;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setProductImage(byte[] productImage) {
        this.productImage = productImage;
    }

    public byte[] getProductImage() {
        return productImage;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    /**
     * Calculates the currentPrice value for the {@link Product} instance, considering {@link Product#rebates}
     * @return {@link BigDecimal} value representing the product price after rebates
     */
    @MetaProperty
    public BigDecimal getCurrentPrice() {
        if (msrp == null)
            return null;

        if (PersistenceHelper.isLoaded(this, "rebates")) {
            final Date now = new Date();
            BigDecimal totalRebate = rebates.stream()
                    .filter(e ->
                            (e.rebateStart == null || now.after(e.rebateStart))
                                    && (e.rebateEnd == null || now.before(e.rebateEnd))
                                    && e.rebate != null
                    )
                    .map(ProductRebate::getRebate)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            return msrp.subtract(totalRebate);
        }
        return null;
    }
}