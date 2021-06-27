package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class UserFeedbackService {

    /**
     * Method used to create the feedback object if the user don't have one
     * @param owner
     * @return the feedback object
     */
    UserFeedback createUserFeedback(User owner) {
        UserFeedback uf = new UserFeedback()
        owner.feedback = uf
        owner.save()
        uf
    }

    /**
     * Method used to update the AddToList counters of the specified user's userFeedback
     * @param owner
     * @param recommendationType
     * @return the updated userFeedback
     */
    UserFeedback updateAddToList(User owner,String recommendationType){
        if(!owner?.feedback)
            return null
        else{
            switch (recommendationType){
                case "forUser":
                    owner.feedback.addToListRecommend++
                    break
                case "relatedQuery":
                    owner.feedback.addToListRelatedToQuery++
                    break
                case "semanticSearch":
                    owner.feedback.addToListSearch++
                    break
                case "relatedCourse":
                    owner.feedback.addToListRelatedToCourse++
                    break
                case "explore":
                    owner.feedback.addToListExplore++
                    break
                default:
                    return null
            }
            owner.feedback.save()
        }
    }

    /**
     * Method used to update the clicks counters of the specified user's userFeedback
     * @param owner
     * @param recommendationType
     * @return the updated userFeedback
     */
    UserFeedback updateClicks(User owner,String recommendationType){
        if(!owner?.feedback)
            return null
        else{
            switch (recommendationType){
                case "forUser":
                    owner.feedback.clicksRecommend++
                    break
                case "relatedQuery":
                    owner.feedback.clicksRelatedToQuery++
                    break
                case "semanticSearch":
                    owner.feedback.clicksSearch++
                    break
                case "relatedCourse":
                    owner.feedback.clicksRelatedToCourse++
                    break
                case "explore":
                    owner.feedback.clicksExplore++
                    break
                default:
                    return null
            }
            owner.feedback.save()
        }
    }

    /**
     * Method used to update the notInterested counters of the specified user's userFeedback
     * @param owner
     * @param recommendationType
     * @return the updated userFeedback
     */
    UserFeedback updateNotInterested(User owner,String recommendationType){
        if(!owner?.feedback)
            return null
        else{
            switch (recommendationType){
                case "Coursera":
                    owner.feedback.notInterestedCoursera++
                    break
                case "Udacity":
                    owner.feedback.notInterestedUdacity++
                    break
                case "Udemy":
                    owner.feedback.notInterestedUdemy++
                    break
                default:
                    return null
            }
            owner.feedback.save()
        }
    }
}
