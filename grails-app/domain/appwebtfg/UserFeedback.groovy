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
    int noInteresaCoursera
    int noInteresaUdemy
    int noInteresaUdacity

    static constraints = {
    }
}
