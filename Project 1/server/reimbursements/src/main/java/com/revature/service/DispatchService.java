package com.revature.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.exceptions.AlreadySetException;
import com.revature.exceptions.SelfSetException;
import com.revature.exceptions.UserNotFoundException;
import com.revature.exceptions.WrongPasswordException;
import com.revature.model.*;
import com.revature.util.Mapper;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

import static com.revature.service.EmployeeService.getEmployeeNames;
import static com.revature.service.EmployeeService.login;
import static com.revature.service.EmployeeService.updateEmployeeInfo;
import static com.revature.service.ReimbursementService.*;
import static com.revature.util.OtherUtils.*;

public class DispatchService {
    private static Logger logger = Logger.getLogger(DispatchService.class);
    public static void dispatchLogin(HttpServletRequest request, HttpServletResponse response) throws UserNotFoundException, WrongPasswordException, JsonProcessingException {
        SimpleEmployee e = (SimpleEmployee) Mapper.mapRequest(request, SimpleEmployee.class);
        logger.debug(e);
        String outStr = login(e.getUsername(), e.getPassword());
        if (isJSONish(outStr)) {
            jsonResponse(outStr, response);
        } else {
            stringReponse(outStr, response);
        }
    }

    public static void dispatchMyReimbursements(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        ObjectMapper om = new ObjectMapper();
        SimpleEmployee e = (SimpleEmployee) Mapper.mapRequest(request, SimpleEmployee.class);
        logger.debug(e);
        String outStr = om.writeValueAsString(getReimbursementsByUser(e.getUsername()));
        if (isJSONish(outStr)) {
            jsonResponse(outStr, response);
        } else {
            stringReponse(outStr, response);
        }
    }
    public static void dispatchCreateReimbursement(HttpServletRequest request, HttpServletResponse response) {
        CreateReimbursementModel crm = (CreateReimbursementModel)
                Mapper.mapRequest(request, CreateReimbursementModel.class);
        logger.debug(crm);
        booleanResponse(createReimbursement(crm), response);
    }
    public static void dispatchUpdateInfo(HttpServletRequest request, HttpServletResponse response) {
        Employee crm = (Employee) Mapper.mapRequest(request, Employee.class);
        logger.debug(crm);
        booleanResponse(updateEmployeeInfo(crm), response);
    }

    public static void dispatchEmployeeList(HttpServletRequest request, HttpServletResponse response)
            throws JsonProcessingException {
        ObjectMapper om = new ObjectMapper();
        String el = om.writeValueAsString(getEmployeeNames());
        logger.debug(el);
        jsonResponse(el, response);
    }

    public static void dispatchAllReimbusements(HttpServletRequest request, HttpServletResponse response)
            throws JsonProcessingException {
        ObjectMapper om = new ObjectMapper();
        String reimbOut = om.writeValueAsString(getAllReimbursements());
        logger.debug(reimbOut);
        jsonResponse(reimbOut, response);
    }

    public static void dispatchSetRStatus(HttpServletRequest request, HttpServletResponse response) throws AlreadySetException,
            SelfSetException {
        ObjectMapper om = new ObjectMapper();
        RStatusModel rsm = (RStatusModel) Mapper.mapRequest(request, RStatusModel.class);
        setRid(rsm);
        stringReponse("success",response);
    }

    public static void dispatchFile(HttpServletRequest request, HttpServletResponse response) {
        ObjectMapper om = new ObjectMapper();
        TestRequest tr = (TestRequest) Mapper.mapRequest(request, TestRequest.class);
        logger.debug("dispatch file");
        logger.debug(tr);
    }

}