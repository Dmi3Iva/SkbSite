package com.kantiana.skb.web;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;

@Controller
public class WorkingWithFile {

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);


    @ResponseBody
    @RequestMapping(value = "/images/{name}.jpg", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] imageJPGOnThePage(@PathVariable String name) throws Exception{
        InputStream in = null;
        String rootPath = System.getProperty("user.dir");
        File f = new File(rootPath+"/../images/"+name+".jpg");
        in = new FileInputStream(f);


        return IOUtils.toByteArray(in);
    }

    @ResponseBody
    @RequestMapping(value = "/images/{name}.png", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
    public byte[] imagePNGOnThePage(@PathVariable String name) throws Exception{
        InputStream in = null;
        String rootPath = System.getProperty("user.dir");
        File f = new File(rootPath+"/../images/"+name+".png");
        if(!f.exists())
            return null;
        in = new FileInputStream(f);


        return IOUtils.toByteArray(in);
    }

    @ResponseBody
    @RequestMapping(value = "/images/{name}.jpg", method = RequestMethod.POST, produces = MediaType.IMAGE_JPEG_VALUE)
    public String imageJPGOnThePagePost(@ModelAttribute("file") MultipartFile file) throws Exception{
        return uploadFile(file);
    }


    @RequestMapping(value = "/images/upload", method = RequestMethod.POST)
    public @ResponseBody
    List<String> uploadFileSummerNote(@RequestParam(value = "files", required = false) List<MultipartFile> file) {
        java.util.List<String> result = new ArrayList<String>();
        for (MultipartFile mf:
             file) {
            result.add(uploadFile(mf));
        }

        return result;
    }

    @RequestMapping(value = "/images/delete", method = RequestMethod.POST)
    public void deleteFileSummerNote(@RequestParam(value = "fileUrl", required = false) String name) {
        try{
            name = name.substring(21);
            String rootPath = System.getProperty("user.dir");
            File file = new File(rootPath+"/.."+name);

            if(file.delete()){
                System.out.println(file.getName() + " is deleted!");
            }else{
                System.out.println("Delete operation is failed.");
            }

        }catch(Exception e){

            e.printStackTrace();

        }

    }

    @ResponseBody
    @RequestMapping(value = "/images/{name}.png", method = RequestMethod.POST, produces = MediaType.IMAGE_PNG_VALUE)
    public String imagePNGOnThePagePost(@ModelAttribute("file") MultipartFile file) throws Exception{
        return uploadFile(file);
    }

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
                File dir = new File(rootPath+"/../images/");

                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File uploadedFile = new File(dir.getAbsolutePath() + File.separator + name);
                Random a= new Random();
                res = "/images/"+name;
                String random = new String();
                while(uploadedFile.exists())
                {
                    random = String.valueOf(a.nextInt());
                    uploadedFile = new File(dir.getAbsolutePath() + File.separator + random + name);
                    res = "/images/"+random +name;
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
