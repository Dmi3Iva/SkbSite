package com.kantiana.skb.web;

import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;

/**
 * Created by FTL on 26.05.2017.
 */
public class WorkingWithFile {

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);


    static public void  UploadFile(){
    }

    static public String uploadFile(MultipartFile file) {
        String name = null,res=null;

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                name = file.getOriginalFilename();


                String rootPath = System.getProperty("user.dir");
                //Директория
                File dir = new File(rootPath+"\\..\\webapps\\ROOT\\resources\\images\\");

                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File uploadedFile = new File(dir.getAbsolutePath() + File.separator + name);
                Random a= new Random();
                res = "/resources/images/"+name;
                String random = new String();
                while(uploadedFile.exists())
                {
                    random = String.valueOf(a.nextInt());
                    uploadedFile = new File(dir.getAbsolutePath() + File.separator + random + name);
                    res = "/resources/images/"+random +name;
                }

                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadedFile));
                stream.write(bytes);
                stream.flush();
                stream.close();

                logger.info("uploaded: " + uploadedFile.getAbsolutePath()+'\n'+"uploaded-cath:"+uploadedFile.getCanonicalPath());


                return res;

            } catch (Exception e) {
                return null;
            }
        } else {
            return null;
        }
    }
}
