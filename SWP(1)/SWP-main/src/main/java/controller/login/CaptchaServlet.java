package controller.login;

import jakarta.servlet.http.HttpSession;
import javax.imageio.ImageIO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import dao.CapchaDAO;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/CaptchaServlet"})
public class CaptchaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CapchaDAO captchaDAO = new CapchaDAO();
        String captcha = captchaDAO.getCapcha();
        if (captcha != null) {
            int width = 100, height = 35;
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D graphics = bufferedImage.createGraphics();
            graphics.setFont(new Font("Arial", Font.BOLD, 20));
            graphics.setColor(new Color(210, 180, 140));
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(new Color(255, 255, 255));
            graphics.drawString(captcha, 20, 25);
            // Apply noise to the captcha image
            applyNoise(bufferedImage);
            // addRandomLines(bufferedImage);
            Color lineColor = new Color(255, 255, 255);
            graphics.setColor(lineColor);
            int strokeWidth = 2;
            graphics.setStroke(new BasicStroke(strokeWidth));
            graphics.drawLine(10, 13, 90, 13);
            graphics.drawLine(10, 22, 90, 22);
            // Set the response content type
            response.setContentType("image/jpeg");
            // Write the captcha image to the response output stream
            OutputStream outputStream = response.getOutputStream();
            ImageIO.write(bufferedImage, "jpeg", outputStream);
            outputStream.close();
            // Store the captcha value in the session
            HttpSession session = request.getSession(true);
            session.setAttribute("captcha", captcha);
        } else {
            
        }
    }

    private void applyNoise(BufferedImage image) {
        int width = image.getWidth();
        int height = image.getHeight();

        // Iterate through each pixel of the image
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                // Get the RGB color of the pixel
                int rgb = image.getRGB(x, y);

                // Generate a random noise value between -20 and 20
                int noise = (int) (Math.random() * 41) - 20;

                // Apply noise to the RGB values
                int red = (rgb >> 16) & 0xFF;
                int green = (rgb >> 8) & 0xFF;
                int blue = rgb & 0xFF;

                red = Math.min(Math.max(red + noise, 0), 255);
                green = Math.min(Math.max(green + noise, 0), 255);
                blue = Math.min(Math.max(blue + noise, 0), 255);

                // Set the new RGB values to the pixel
                image.setRGB(x, y, (red << 16) | (green << 8) | blue);
            }
        }
    }

//    private void addRandomLines(BufferedImage image) {
//        Graphics2D graphics = image.createGraphics();
//        int width = image.getWidth()-10;
//        int height = image.getHeight()+10;
//
//        // Set line color and thickness
//        graphics.setColor(Color.BLACK);
//        graphics.setStroke(new BasicStroke(2));
//
//        // Draw a random number of lines
////        int numLines = (int) (Math.random() * 3) + 1;
//        int numLines = 3;
//        for (int i = 0; i < numLines; i++) {
////            int x1 = (int) (Math.random() * width);
//            int x1 = 10;
////            int y1 = (int) (Math.random() * height);
//            int y1 = 18;
//            int x2 = (int) (Math.random() * width)+40;
//            int y2 = (int) (Math.random() * height);
//            graphics.drawLine(x1, y1, x2, y2);
//        }
//
//        // Dispose the graphics object
//        graphics.dispose();
//    }
//    
//    private void addCrossingLines(BufferedImage image) {
//        Graphics2D graphics = image.createGraphics();
//        int width = image.getWidth();
//        int height = image.getHeight();
//
//        // Set line color and thickness
//        graphics.setColor(Color.ORANGE);
//        graphics.setStroke(new BasicStroke(2));
//
//        // Draw the first line from top-left to bottom-right
//        graphics.drawLine(0, 0, width, height);
//
//        // Draw the second line from top-right to bottom-left
//        graphics.drawLine(width, 0, 0, height);
//
//        // Dispose the graphics object
//        graphics.dispose();
//    }
}
