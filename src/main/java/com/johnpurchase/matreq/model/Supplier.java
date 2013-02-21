package com.johnpurchase.matreq.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Set;
import com.johnpurchase.matreq.model.MaterialDesc;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findSuppliersByMaterialDescs" })
public class Supplier {

    @NotNull
    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<MaterialDesc> materialDescs = new HashSet<MaterialDesc>();
}
