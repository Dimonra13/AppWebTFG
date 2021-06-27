package appwebtfg

class UserFeedback {

    static belongsTo = [user : User]
    long clicksSearch
    long clicksRecommend
    long clicksRelatedToQuery
    long clicksRelatedToCourse
    long clicksExplore
    long addToListSearch
    long addToListRecommend
    long addToListRelatedToQuery
    long addToListRelatedToCourse
    long addToListExplore
    long notInterestedCoursera
    long notInterestedUdemy
    long notInterestedUdacity

    static constraints = {
    }
}
