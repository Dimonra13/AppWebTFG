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
                default:
                    return null
            }
            owner.feedback.save()
        }
    }

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
                default:
                    return null
            }
            owner.feedback.save()
        }
    }
}
