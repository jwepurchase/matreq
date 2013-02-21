// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.model;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.MaterialRequest;
import com.johnpurchase.matreq.model.Purchaser;
import com.johnpurchase.matreq.model.Supplier;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new MaterialDescConverter());
        registry.addConverter(new MaterialRequestConverter());
        registry.addConverter(new PurchaserConverter());
        registry.addConverter(new SupplierConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class com.johnpurchase.matreq.model.ApplicationConversionServiceFactoryBean.MaterialDescConverter implements Converter<MaterialDesc, String> {
        public String convert(MaterialDesc materialDesc) {
            return new StringBuilder().append(materialDesc.getName()).toString();
        }
        
    }
    
    static class com.johnpurchase.matreq.model.ApplicationConversionServiceFactoryBean.MaterialRequestConverter implements Converter<MaterialRequest, String> {
        public String convert(MaterialRequest materialRequest) {
            return new StringBuilder().append(materialRequest.getRequestDate()).append(" ").append(materialRequest.getUnitCount()).append(" ").append(materialRequest.getDaysToDelivery()).toString();
        }
        
    }
    
    static class com.johnpurchase.matreq.model.ApplicationConversionServiceFactoryBean.PurchaserConverter implements Converter<Purchaser, String> {
        public String convert(Purchaser purchaser) {
            return new StringBuilder().append(purchaser.getName()).toString();
        }
        
    }
    
    static class com.johnpurchase.matreq.model.ApplicationConversionServiceFactoryBean.SupplierConverter implements Converter<Supplier, String> {
        public String convert(Supplier supplier) {
            return new StringBuilder().append(supplier.getName()).toString();
        }
        
    }
    
}
