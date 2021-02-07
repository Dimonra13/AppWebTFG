package appwebtfg

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
}
