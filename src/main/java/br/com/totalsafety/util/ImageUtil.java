package br.com.totalsafety.util;

import br.com.totalsafety.exception.ImageSizeException;
import java.io.IOException;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;

public class ImageUtil {

    private static final Long MAX_FILE_SIZE = 1000000L;

    public static String multipartFileToBase64String(MultipartFile imageUpload) throws RuntimeException, IOException, ImageSizeException {
        if (imageUpload == null || imageUpload.isEmpty()) {
            return "";
        }
        validateImage(imageUpload);
        String imageBase64 = "data:image/jpeg;base64,"
                + Base64.encodeBase64URLSafeString(imageUpload.getBytes())
                .replaceAll("_", "/").replaceAll("-", "+");
        if (imageBase64 != null && !imageBase64.isEmpty()) {
            return imageBase64;
        }
        return "";
    }

    private static void validateImage(MultipartFile image) throws ImageSizeException {
        if (!image.getContentType().equals("image/jpeg")) {
            throw new RuntimeException("Only JPG images are accepted");
        }
        if (image.getSize() > MAX_FILE_SIZE) {
            throw new ImageSizeException("Image size is bigger than "+MAX_FILE_SIZE);
        }
    }
}
