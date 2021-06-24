package appwebtfg

class UserFeedback {

    static belongsTo = [user : User]
    int clicksSearch
    int clicksRecommend
    int clicksRelatedToQuery
    int clicksRelatedToCourse

    static constraints = {
    }
}
