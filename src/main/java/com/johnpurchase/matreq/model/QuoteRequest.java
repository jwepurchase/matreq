package com.johnpurchase.matreq.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.johnpurchase.matreq.model.Supplier;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import com.johnpurchase.matreq.model.MaterialRequest;

@RooJavaBean
@RooToString
@RooEntity
public class QuoteRequest {

    @NotNull
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date requestDate;

    @NotNull
    @ManyToOne
    private Supplier supplier;

    @NotNull
    @ManyToOne
    private MaterialRequest materialRequest;
}
