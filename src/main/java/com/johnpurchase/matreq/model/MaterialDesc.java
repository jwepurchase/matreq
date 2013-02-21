package com.johnpurchase.matreq.model;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Set;
import com.johnpurchase.matreq.model.Supplier;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class MaterialDesc {

    @NotNull
    private String name;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "materialDescs")
    private Set<Supplier> suppliers = new HashSet<Supplier>();
}
