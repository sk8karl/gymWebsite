package com.karl;
import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
public class main {

    public static void main(String[] args) {

        SpringApplication.run(main.class, args);

    }
/*    @Configuration
    public class TomcatConfig {

        @Value("${http.port}")
        private int httpPort;

        @Bean
        public EmbeddedServletContainerCustomizer containerCustomizer() {
            return new EmbeddedServletContainerCustomizer() {
                @Override
                public void customize(ConfigurableEmbeddedServletContainer container) {
                    if (container instanceof TomcatEmbeddedServletContainerFactory) {
                        TomcatEmbeddedServletContainerFactory containerFactory =
                                (TomcatEmbeddedServletContainerFactory) container;

                        Connector connector = new Connector(TomcatEmbeddedServletContainerFactory.DEFAULT_PROTOCOL);
                        connector.setPort(httpPort);
                        containerFactory.addAdditionalTomcatConnectors(connector);
                    }
                }
            };
        }

    }
*/
}


