
package soap;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebService(name = "SOAPWebService", targetNamespace = "http://soap.com/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface SOAPWebService {


    /**
     * 
     * @param arg0
     */
    @WebMethod
    @RequestWrapper(localName = "addMessage", targetNamespace = "http://soap.com/", className = "soap.AddMessage")
    @ResponseWrapper(localName = "addMessageResponse", targetNamespace = "http://soap.com/", className = "soap.AddMessageResponse")
    @Action(input = "http://soap.com/SOAPWebService/addMessageRequest", output = "http://soap.com/SOAPWebService/addMessageResponse")
    public void addMessage(
        @WebParam(name = "arg0", targetNamespace = "")
        String arg0);

    /**
     * 
     * @return
     *     returns java.util.List<java.lang.String>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "readMessages", targetNamespace = "http://soap.com/", className = "soap.ReadMessages")
    @ResponseWrapper(localName = "readMessagesResponse", targetNamespace = "http://soap.com/", className = "soap.ReadMessagesResponse")
    @Action(input = "http://soap.com/SOAPWebService/readMessagesRequest", output = "http://soap.com/SOAPWebService/readMessagesResponse")
    public List<String> readMessages();

}