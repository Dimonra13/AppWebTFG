package appwebtfg

class UserFeedback {

    static belongsTo = [user : User]
    int clicksSearch
    int clicksRecommend
    int clicksRelatedToQuery
    int clicksRelatedToCourse
    int addToListSearch
    int addToListRecommend
    int addToListRelatedToQuery
    int addToListRelatedToCourse
    int notInterestedCoursera
    int notInterestedUdemy
    int notInterestedUdacity

    static constraints = {
    }
}
