package appwebtfg

import appwebtfg.cmd.ImageCommandObject
import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    /**
     * Method to get all the user with name $username or email $email with a public profile
     * @param username
     * @param email
     * @return the list of users who meet these criteria
     */
    List<User> findUsers(String username, String email){
        User.createCriteria().list {
            eq("isPublicProfile",true)
            or{
                if (username) ilike("username", "%${username}%")
                if (email) ilike("email", "%${email}%")
            }
        } as List<User>
    }

    /**
     * Method used to update the personal information of the user $currentUser using the information in $updatedUser
     * @param updatedUser
     * @param currentUser
     * @param changedPassword
     * @return the user with the new personal information
     */
    User updateUser(User updatedUser, User currentUser, boolean changedPassword){
        currentUser.username = updatedUser.username
        currentUser.email = updatedUser.email
        currentUser.phoneNumber = updatedUser.phoneNumber
        currentUser.age = updatedUser.age
        if(changedPassword){
            currentUser.password = updatedUser.password
        }
        currentUser.save()
    }

    /**
     * Method used to update the profile image of the user $user
     * @param user
     * @param cmd
     * @return the user with the profile image updated
     */
    User updateProfileImage(User user, ImageCommandObject cmd) {
        user.profileImageBytes = cmd.featuredImageFile.bytes
        user.profileImageContentType = cmd.featuredImageFile.contentType
        user.hasProfileImage = true
        user.save()
    }

    /**
     * Method used to delete the profile image of the user $user
     * @param user
     * @return the user with the profile image deleted
     */
    User deleteProfileImage(User user) {
        user.profileImageBytes = null
        user.profileImageContentType = null
        user.hasProfileImage = false
        user.save()
    }

    /**
     * Method used to make the profile of the user $user public
     * @param user
     * @return the user with the profile public
     */
    User makeProfilePublic(User user) {
        user?.isPublicProfile=true
        user?.save()
    }

    /**
     * Method used to make the profile of the user $user private
     * @param user
     * @return the user with the profile private
     */
    User makeProfilePrivate(User user) {
        user?.isPublicProfile=false
        user?.save()
    }

    /**
     * Method used to update the user $user interests list
     * @param user
     * @param userInterests
     * @return the user with the list of interests updated
     */
    User updateInterests(User user,List<String> userInterests){
        user?.interests = userInterests ?: []
        user?.save()
    }

    /**
     * Method used to update the user $user course preferences (duration, cost, popularity, difficulty)
     * @param user
     * @param duration
     * @param cost
     * @param popularity
     * @param difficulty
     * @return the user with the preferences updated
     */
    User updatePreferences(User user, Float duration, Float  cost, Float popularity, Float difficulty){
        user.duration=duration
        user.cost=cost
        user.popularity=popularity
        user.difficulty=difficulty
        user.save()
    }
}

