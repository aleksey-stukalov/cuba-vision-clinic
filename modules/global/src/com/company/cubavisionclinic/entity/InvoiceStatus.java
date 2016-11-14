package com.company.cubavisionclinic.entity;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum InvoiceStatus implements EnumClass<Integer> {

    ACTIVE(0),
    PAID(1),
    OVERDUE(2);

    private Integer id;

    InvoiceStatus(Integer value) {
        this.id = value;
    }

    public Integer getId() {
        return id;
    }

    @Nullable
    public static InvoiceStatus fromId(Integer id) {
        for (InvoiceStatus at : InvoiceStatus.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}