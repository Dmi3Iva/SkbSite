package com.kantiana.skb.web;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.logging.impl.Log4JLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AdminController {

    private static final Logger log = LoggerFactory.getLogger(FileUpload.class);

    @Secured ({"ROLE_ADMIN"})
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    String adminPageGET(Model model)
    {
        return "adminPage";
    }

//    @Secured ({"ROLE_ADMIN"})
//    @RequestMapping(value = "/backup-admin", method = RequestMethod.GET)
//    void admindDataBaseGET(Model model, HttpServletResponse response)
//    {
//        File file =backupDataWithDatabase();
////        File file = backupDataWithDatabase("psql","localohost"
////        ,"5432", "skb","", "skb","Path");
////
////        try {
////            // get your file as InputStream
////            InputStream is = file;
////            // copy it to response's OutputStream
////            org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
////            response.flushBuffer();
////        } catch (IOException ex) {
////            log.info("Error writing file to output stream. Filename was '{}'" + file.getName() + ex);
////            throw new RuntimeException("IOError writing file to output stream");
////        }
//    }


//    static public File backupDataWithDatabase() {
//        boolean status = false;
//        String dumpExePath, host=, port, user, password, database, backupPath;
//        try {
//            Process p = null;
//
//            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
//            Date date = new Date();
//            String filepath = "backup(with_DB)-" + database + "-" + host + "-(" + dateFormat.format(date) + ").sql";
//
//            String batchCommand = "";
//            if (password != "") {
//                //Backup with database
//                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
//            } else {
//                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
//            }
//
//            Runtime runtime = Runtime.getRuntime();
//            p = runtime.exec(batchCommand);
//            int processComplete = p.waitFor();
//
//            if (processComplete == 0) {
//                status = true;
//                return null;
//            } else {
//                status = false;
//                return null;
//            }
//
//        } catch (IOException ioe) {
//            return null;
//        } catch (Exception e) {
//            return null;
//        }
//    }
}

