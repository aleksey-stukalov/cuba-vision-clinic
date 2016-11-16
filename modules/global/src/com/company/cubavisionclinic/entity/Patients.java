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

import javax.persistence.Entity;
import javax.persistence.Table;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.global.DesignSupport;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.haulmont.cuba.core.entity.BaseIdentityIdEntity;
import com.haulmont.cuba.core.entity.Updatable;
import com.haulmont.cuba.core.entity.Creatable;

@DesignSupport("{'imported':true,'unmappedColumns':['RowVersion']}")
@NamePattern("%s|name")
@Table(name = "Patients")
@Entity(name = "cubavisionclinic$Patients")
public class Patients extends BaseIdentityIdEntity implements Updatable, Creatable {
    private static final long serialVersionUID = 6742155131411859055L;

    @Column(name = "Name", nullable = false)
    protected String name;

    @Column(name = "Street", nullable = false)
    protected String street;

    @Column(name = "Street2")
    protected String street2;

    @Column(name = "City", nullable = false)
    protected String city;

    @Column(name = "State", nullable = false)
    protected String state;

    @Column(name = "Zip", nullable = false)
    protected String zip;

    @Column(name = "PrimaryPhone", nullable = false)
    protected String primaryPhone;

    @Column(name = "SecondaryPhone")
    protected String secondaryPhone;

    @Column(name = "Email")
    protected String email;

    @Column(name = "PolicyNumber", nullable = false, length = 12)
    protected String policyNumber;

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

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet2(String street2) {
        this.street2 = street2;
    }

    public String getStreet2() {
        return street2;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getZip() {
        return zip;
    }

    public void setPrimaryPhone(String primaryPhone) {
        this.primaryPhone = primaryPhone;
    }

    public String getPrimaryPhone() {
        return primaryPhone;
    }

    public void setSecondaryPhone(String secondaryPhone) {
        this.secondaryPhone = secondaryPhone;
    }

    public String getSecondaryPhone() {
        return secondaryPhone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPolicyNumber(String policyNumber) {
        this.policyNumber = policyNumber;
    }

    public String getPolicyNumber() {
        return policyNumber;
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