package br.com.totalsafety.exception;

public class ImageSizeException extends Exception {

    public ImageSizeException() {
    }

    public ImageSizeException(String description) {
        super(description);
    }
}
