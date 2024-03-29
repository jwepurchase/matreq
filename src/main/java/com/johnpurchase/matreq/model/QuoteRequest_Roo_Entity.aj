// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.QuoteRequest;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect QuoteRequest_Roo_Entity {
    
    declare @type: QuoteRequest: @Entity;
    
    @PersistenceContext
    transient EntityManager QuoteRequest.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long QuoteRequest.id;
    
    @Version
    @Column(name = "version")
    private Integer QuoteRequest.version;
    
    public Long QuoteRequest.getId() {
        return this.id;
    }
    
    public void QuoteRequest.setId(Long id) {
        this.id = id;
    }
    
    public Integer QuoteRequest.getVersion() {
        return this.version;
    }
    
    public void QuoteRequest.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void QuoteRequest.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void QuoteRequest.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            QuoteRequest attached = QuoteRequest.findQuoteRequest(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void QuoteRequest.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void QuoteRequest.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public QuoteRequest QuoteRequest.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        QuoteRequest merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager QuoteRequest.entityManager() {
        EntityManager em = new QuoteRequest().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long QuoteRequest.countQuoteRequests() {
        return entityManager().createQuery("SELECT COUNT(o) FROM QuoteRequest o", Long.class).getSingleResult();
    }
    
    public static List<QuoteRequest> QuoteRequest.findAllQuoteRequests() {
        return entityManager().createQuery("SELECT o FROM QuoteRequest o", QuoteRequest.class).getResultList();
    }
    
    public static QuoteRequest QuoteRequest.findQuoteRequest(Long id) {
        if (id == null) return null;
        return entityManager().find(QuoteRequest.class, id);
    }
    
    public static List<QuoteRequest> QuoteRequest.findQuoteRequestEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM QuoteRequest o", QuoteRequest.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
