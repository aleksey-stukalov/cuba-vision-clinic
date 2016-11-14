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
import com.haulmont.chile.core.annotations.NamePattern;

@NamePattern("%s - %s|appointmentPatient,appointmentTime")
@DesignSupport("{'imported':true,'unmappedColumns':['RowVersion']}")
@Table(name = "Appointments")
@Entity(name = "cubavisionclinic$Appointments")
public class Appointments extends BaseIdentityIdEntity implements Updatable, Creatable {
    private static final long serialVersionUID = 8708805336679113L;

    @Temporal(TemporalType.TIME)
    @Column(name = "AppointmentTime", nullable = false)
    protected Date appointmentTime;

    @Temporal(TemporalType.DATE)
    @Column(name = "AppointmentDate", nullable = false)
    protected Date appointmentDate;

    @Column(name = "AppointmentType", nullable = false)
    protected Integer appointmentType;

    @Column(name = "DoctorNotes")
    protected String doctorNotes;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Appointment_Patient")
    protected Patients appointmentPatient;

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

    public AppointmentType getAppointmentType() {
        return appointmentType == null ? null : AppointmentType.fromId(appointmentType);
    }

    public void setAppointmentType(AppointmentType appointmentType) {
        this.appointmentType = appointmentType == null ? null : appointmentType.getId();
    }


    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setDoctorNotes(String doctorNotes) {
        this.doctorNotes = doctorNotes;
    }

    public String getDoctorNotes() {
        return doctorNotes;
    }

    public void setAppointmentPatient(Patients appointmentPatient) {
        this.appointmentPatient = appointmentPatient;
    }

    public Patients getAppointmentPatient() {
        return appointmentPatient;
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