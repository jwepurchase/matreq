// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.MaterialDesc;
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

privileged aspect MaterialDesc_Roo_Entity {
    
    declare @type: MaterialDesc: @Entity;
    
    @PersistenceContext
    transient EntityManager MaterialDesc.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long MaterialDesc.id;
    
    @Version
    @Column(name = "version")
    private Integer MaterialDesc.version;
    
    public Long MaterialDesc.getId() {
        return this.id;
    }
    
    public void MaterialDesc.setId(Long id) {
        this.id = id;
    }
    
    public Integer MaterialDesc.getVersion() {
        return this.version;
    }
    
    public void MaterialDesc.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void MaterialDesc.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MaterialDesc.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MaterialDesc attached = MaterialDesc.findMaterialDesc(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MaterialDesc.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void MaterialDesc.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public MaterialDesc MaterialDesc.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MaterialDesc merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager MaterialDesc.entityManager() {
        EntityManager em = new MaterialDesc().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MaterialDesc.countMaterialDescs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MaterialDesc o", Long.class).getSingleResult();
    }
    
    public static List<MaterialDesc> MaterialDesc.findAllMaterialDescs() {
        return entityManager().createQuery("SELECT o FROM MaterialDesc o", MaterialDesc.class).getResultList();
    }
    
    public static MaterialDesc MaterialDesc.findMaterialDesc(Long id) {
        if (id == null) return null;
        return entityManager().find(MaterialDesc.class, id);
    }
    
    public static List<MaterialDesc> MaterialDesc.findMaterialDescEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MaterialDesc o", MaterialDesc.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
