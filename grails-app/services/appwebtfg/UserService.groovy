package appwebtfg

import appwebtfg.cmd.ImageCommandObject
import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    User updateUser(User updatedUser, User currentUser, boolean changedPassword){
        currentUser.username = updatedUser.username
        currentUser.email = updatedUser.email
        currentUser.phoneNumber = updatedUser.phoneNumber
        if(changedPassword){
            currentUser.password = updatedUser.password
        }
        currentUser.save()
    }

    User updateProfileImage(User user, ImageCommandObject cmd) {
        user.profileImageBytes = cmd.featuredImageFile.bytes
        user.profileImageContentType = cmd.featuredImageFile.contentType
        user.hasProfileImage = true
        user.save()
    }

    User deleteProfileImage(User user) {
        user.profileImageBytes = null
        user.profileImageContentType = null
        user.hasProfileImage = false
        user.save()
    }
}