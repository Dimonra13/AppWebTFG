package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

class CategoryController {

    Set<String> categories = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                              'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                              'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                              'Graphic-Design','Gaming','Google','Apple','Oracle','Microsoft','SAP']
    Set <String> science = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Security',
                            'Software-Engineering','Maths','Science','Gaming','IT-Certification',
                            'Test-Prep','Architecture']
    Set<String> humanities = ['Business-Finance','Leadership','Entrepreneurship','Personal-Development',
                              'Human-Studies','Arts','Education','Health','Marketing','Graphic-Design']
    @Secured(["permitAll"])
    def getCategory(String id) {
        if(!id||!categories.contains(id))
            render status: 404
        else
            render(view: "categoriesIndex",model: [
                    categoryGroup: science.contains(id) ? "science" : humanities.contains(id) ? "humanities" : "brands"
            ])
    }
}
