package appwebtfg.cmd

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class ImageCommandObject implements Validateable {
    MultipartFile featuredImageFile
    Long ownerId

    static constraints = {
        ownerId nullable: false
        featuredImageFile  validator: { val, obj ->
            if ( val == null ) {
                return false
            }
            if ( val.empty ) {
                return false
            }
            //Only files that ends in JPEG, JPG or PNG are allowed
            ['jpeg', 'jpg', 'png'].any { extension ->
                val.originalFilename?.toLowerCase()?.endsWith(extension)
            }
        }
    }
}
