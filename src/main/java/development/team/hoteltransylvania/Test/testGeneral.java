package development.team.hoteltransylvania.Test;

import development.team.hoteltransylvania.Util.LoggerConfifg;

import java.util.logging.Logger;

public class testGeneral {
    private static final Logger LOGGER = LoggerConfifg.getLogger(testGeneral.class);
    public static void main(String[] args) {
        LOGGER.warning("ERrror fatal");
        LOGGER.info("testGeneral");

    }
}
