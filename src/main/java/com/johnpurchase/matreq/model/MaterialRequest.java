package com.johnpurchase.matreq.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import java.util.HashSet;
import javax.validation.constraints.NotNull;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import org.springframework.format.annotation.DateTimeFormat;
import com.johnpurchase.matreq.model.Purchaser;
import javax.persistence.ManyToOne;
import com.johnpurchase.matreq.model.MaterialDesc;
import java.util.Set;
import com.johnpurchase.matreq.model.QuoteRequest;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class MaterialRequest {

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date requestDate;

    @NotNull
    @ManyToOne
    private Purchaser requester;

    @NotNull
    @ManyToOne
    private MaterialDesc material;

    @NotNull
    private float unitCount;

    @NotNull
    private int daysToDelivery;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<QuoteRequest> quoteRequests = new HashSet<QuoteRequest>();

    @PrePersist
    private void createQuoteRequests() {
        HashSet<MaterialDesc> matdescs = new HashSet<MaterialDesc>();
        matdescs.add(material);
        TypedQuery<Supplier> suppliers = Supplier.findSuppliersByMaterialDescs(matdescs);
        for (Supplier supplier : suppliers.getResultList()) {
        	QuoteRequest qr = new QuoteRequest();
        	qr.setMaterialRequest(this);
        	qr.setRequestDate(new Date());
        	qr.setSupplier(supplier);
        	quoteRequests.add(qr);
        }
    }
}
