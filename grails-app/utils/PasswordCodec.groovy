import java.security.MessageDigest
//import org.apache.commons.codec.binary.Base64

class PasswordCodec{
      static encode = { target->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
      }
}