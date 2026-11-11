import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        // 1. الدخل الذي نريد تحليله
        String filePath = "src/input.js";

        // 2. تمرير النص إلى الـ Lexer الذي قمنا بإنشائه
        SimpleLexer lexer = new SimpleLexer(CharStreams.fromFileName(filePath));

        // 3. جلب جميع التوكنز المستخرجة
        List<? extends Token> tokens = lexer.getAllTokens();

        System.out.println("--- Tokens Found ---");
        for (Token token : tokens) {
            // كود التوكن الاسمي
            String tokenName = lexer.getVocabulary().getSymbolicName(token.getType());

            // رقم السطر والعمود
            int line = token.getLine();
            int col = token.getCharPositionInLine() + 1;

            // طباعة النص المستخرج ونوعه ومكانه
            System.out.println("Text: " + token.getText() + " - Type: " + tokenName + " (" + line + ":" + col + ")");
        }
    }
}