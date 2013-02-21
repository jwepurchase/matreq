// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.Supplier;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Supplier_Roo_Finder {
    
    public static TypedQuery<Supplier> Supplier.findSuppliersByMaterialDescs(Set<MaterialDesc> materialDescs) {
        if (materialDescs == null) throw new IllegalArgumentException("The materialDescs argument is required");
        EntityManager em = Supplier.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Supplier AS o WHERE");
        for (int i = 0; i < materialDescs.size(); i++) {
            if (i > 0) queryBuilder.append(" AND");
            queryBuilder.append(" :materialDescs_item").append(i).append(" MEMBER OF o.materialDescs");
        }
        TypedQuery<Supplier> q = em.createQuery(queryBuilder.toString(), Supplier.class);
        int materialDescsIndex = 0;
        for (MaterialDesc _materialdesc: materialDescs) {
            q.setParameter("materialDescs_item" + materialDescsIndex++, _materialdesc);
        }
        return q;
    }
    
}
