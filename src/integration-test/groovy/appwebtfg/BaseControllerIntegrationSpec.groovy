package appwebtfg

import grails.util.GrailsWebMockUtil
import groovy.transform.CompileStatic
import org.grails.plugins.testing.GrailsMockHttpServletRequest
import org.grails.plugins.testing.GrailsMockHttpServletResponse
import org.grails.web.servlet.mvc.GrailsWebRequest
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.config.AutowireCapableBeanFactory
import org.springframework.mock.web.MockHttpServletRequest
import org.springframework.mock.web.MockHttpServletResponse
import org.springframework.web.context.WebApplicationContext
import org.springframework.web.context.request.RequestContextHolder
import spock.lang.Specification

@CompileStatic
abstract class BaseControllerIntegrationSpec extends Specification {
    @Autowired
    WebApplicationContext ctx
    void setup() {
        TimeZone.setDefault(TimeZone.getTimeZone('UTC'))
        MockHttpServletRequest request = new GrailsMockHttpServletRequest(ctx.servletContext)
        MockHttpServletResponse response = new GrailsMockHttpServletResponse()
        GrailsWebMockUtil.bindMockWebRequest(ctx, request, response)
        currentRequestAttributes.setControllerName(controllerName)
    }
    abstract String getControllerName()
    protected GrailsWebRequest getCurrentRequestAttributes() {
        return (GrailsWebRequest) RequestContextHolder.currentRequestAttributes()
    }
    void cleanup() {
        RequestContextHolder.resetRequestAttributes()
    }
    def autowire(Class clazz) {
        def bean = clazz.newInstance()
        ctx.autowireCapableBeanFactory.autowireBeanProperties(bean, AutowireCapableBeanFactory.AUTOWIRE_BY_NAME, false)
        bean
    }
    def autowire(def bean) {
        ctx.autowireCapableBeanFactory.autowireBeanProperties(bean, AutowireCapableBeanFactory.AUTOWIRE_BY_NAME, false)
        bean
    }
}





