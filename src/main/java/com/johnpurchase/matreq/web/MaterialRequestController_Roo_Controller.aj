// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.johnpurchase.matreq.web;

import com.johnpurchase.matreq.model.MaterialDesc;
import com.johnpurchase.matreq.model.MaterialRequest;
import com.johnpurchase.matreq.model.Purchaser;
import com.johnpurchase.matreq.model.QuoteRequest;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MaterialRequestController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String MaterialRequestController.create(@Valid MaterialRequest materialRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("materialRequest", materialRequest);
            addDateTimeFormatPatterns(uiModel);
            return "materialrequests/create";
        }
        uiModel.asMap().clear();
        materialRequest.persist();
        return "redirect:/materialrequests/" + encodeUrlPathSegment(materialRequest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String MaterialRequestController.createForm(Model uiModel) {
        uiModel.addAttribute("materialRequest", new MaterialRequest());
        addDateTimeFormatPatterns(uiModel);
        List dependencies = new ArrayList();
        if (Purchaser.countPurchasers() == 0) {
            dependencies.add(new String[]{"purchaser", "purchasers"});
        }
        if (MaterialDesc.countMaterialDescs() == 0) {
            dependencies.add(new String[]{"materialdesc", "materialdescs"});
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "materialrequests/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MaterialRequestController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("materialrequest", MaterialRequest.findMaterialRequest(id));
        uiModel.addAttribute("itemId", id);
        return "materialrequests/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MaterialRequestController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("materialrequests", MaterialRequest.findMaterialRequestEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) MaterialRequest.countMaterialRequests() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("materialrequests", MaterialRequest.findAllMaterialRequests());
        }
        addDateTimeFormatPatterns(uiModel);
        return "materialrequests/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MaterialRequestController.update(@Valid MaterialRequest materialRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("materialRequest", materialRequest);
            addDateTimeFormatPatterns(uiModel);
            return "materialrequests/update";
        }
        uiModel.asMap().clear();
        materialRequest.merge();
        return "redirect:/materialrequests/" + encodeUrlPathSegment(materialRequest.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MaterialRequestController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("materialRequest", MaterialRequest.findMaterialRequest(id));
        addDateTimeFormatPatterns(uiModel);
        return "materialrequests/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MaterialRequestController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MaterialRequest.findMaterialRequest(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/materialrequests";
    }
    
    @ModelAttribute("materialdescs")
    public Collection<MaterialDesc> MaterialRequestController.populateMaterialDescs() {
        return MaterialDesc.findAllMaterialDescs();
    }
    
    @ModelAttribute("materialrequests")
    public Collection<MaterialRequest> MaterialRequestController.populateMaterialRequests() {
        return MaterialRequest.findAllMaterialRequests();
    }
    
    @ModelAttribute("purchasers")
    public Collection<Purchaser> MaterialRequestController.populatePurchasers() {
        return Purchaser.findAllPurchasers();
    }
    
    @ModelAttribute("quoterequests")
    public Collection<QuoteRequest> MaterialRequestController.populateQuoteRequests() {
        return QuoteRequest.findAllQuoteRequests();
    }
    
    void MaterialRequestController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("materialRequest_requestdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String MaterialRequestController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
