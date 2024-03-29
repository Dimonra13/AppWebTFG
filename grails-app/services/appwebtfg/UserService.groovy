package appwebtfg

import appwebtfg.cmd.ImageCommandObject
import grails.gorm.PagedResultList
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
        User.createCriteria().list() {
            eq("isPublicProfile",true)
            or{
                ilike("username", "%${username}%")
                ilike("email", "%${email}%")
            }
        } as List<User>
    }

    /**
     * Method to get the users with name $username or email $email and a public profile paginated with offset $offset
     * and page size $max
     * @param username
     * @param email
     * @return the list of users who meet these criteria
     */
    PagedResultList<User> findUsers(String username, String email, int max, int offset){
        User.createCriteria().list(max:max,offset:offset) {
            eq("isPublicProfile",true)
            or{
                ilike("username", "%${username}%")
                ilike("email", "%${email}%")
            }
        }
    }

    /**
     * Method used to update the personal information of the user $currentUser using the information in $updatedUser
     * @param updatedUser
     * @param currentUser
     * @param changedPassword
     * @return the user with the new personal information
     */
    User updateUser(User updatedUser, User currentUser, boolean changedPassword){
        if(updatedUser == null || currentUser == null)
            return null
        currentUser?.username = updatedUser?.username
        currentUser?.email = updatedUser?.email
        currentUser?.phoneNumber = updatedUser?.phoneNumber
        currentUser?.age = updatedUser?.age
        if(changedPassword){
            currentUser?.password = updatedUser?.password
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
        if(user == null || cmd == null)
            return null
        user.profileImageBytes = cmd?.featuredImageFile?.bytes
        user.profileImageContentType = cmd?.featuredImageFile?.contentType
        user.hasProfileImage = true
        user.save()
    }

    /**
     * Method used to delete the profile image of the user $user
     * @param user
     * @return the user with the profile image deleted
     */
    User deleteProfileImage(User user) {
        if(user == null)
            return null
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
        if (user == null)
            return null
        user?.isPublicProfile=true
        user?.save()
    }

    /**
     * Method used to make the profile of the user $user private
     * @param user
     * @return the user with the profile private
     */
    User makeProfilePrivate(User user) {
        if (user == null)
            return null
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
        if (user == null)
            return null
        user?.interests = userInterests ?: []
        user?.save()
    }

    /**
     * Method used to update the user $user language list
     * @param user
     * @param languages
     * @return the user with the list of languages updated
     */
    User updateLanguages(User user,List<String> languages){
        if (user == null)
            return null
        user?.languages = languages ?: []
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
        if(user == null)
            return null
        user.duration=duration
        user.cost=cost
        user.popularity=popularity
        user.difficulty=difficulty
        user.save()
    }

    private final int MAX_RECENT_SEARCHES = 3

    /**
     * Method that saves a search made by the user in its recent search list
     * @param user
     * @param search
     * @return user
     */
    User saveRecentSearch(User user, String search){
        if (user == null)
            return null
        List<String> recentSearches = user?.recentSearches
        if(!recentSearches)
            recentSearches = []
        if(search && !recentSearches?.contains(search)){
            if(recentSearches.size()<MAX_RECENT_SEARCHES)
                recentSearches.add(search)
            else {
                recentSearches.remove(0)
                recentSearches.add(search)
            }
        }
        user.recentSearches=recentSearches
        user.save()
    }

    /**
     * Method that saves the id of the banned course by the user in the banned courses list
     * @param user
     * @param id
     * @return updated user
     */
    User saveBannedCourse(User user, Long id){
        if (user == null)
            return null
        Set<Integer> bannedCourses = user?.bannedCourses
        if(!bannedCourses)
            bannedCourses = []
        if(id){
            bannedCourses.add(id)
        }
        user.bannedCourses=bannedCourses
        user.save()
    }

    /**
     * Method that remove the banned courses from the user explore recommendations
     * @param user
     * @return updated user
     */
    User removeBannedCoursesFromExploreRecommendations(User user){
        if(!user?.exploreRecommendationsIds)
            return user
        else{
            List<Long> exploreRecommendationsIds = user?.exploreRecommendationsIds
            List<Course> courses = user?.lists?.courses?.flatten()
            exploreRecommendationsIds = exploreRecommendationsIds?.findAll{Long id ->
                !user?.bannedCourses?.contains(Course?.get(id)?.idCurso) && !courses?.contains(Course?.get(id))
            }
            user.exploreRecommendationsIds = exploreRecommendationsIds
            user.save()
        }
    }
}

