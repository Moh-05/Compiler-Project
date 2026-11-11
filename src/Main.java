import org.antlr.v4.runtime.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        String inputFile = args.length > 0 ? args[0] : "input.txt";
        System.out.println("Analyzing: " + inputFile + "\n");

        CharStream stream = CharStreams.fromPath(Paths.get(inputFile));
        JavaScriptLexer lexer = new JavaScriptLexer(stream);
        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        tokenStream.fill();

        List<Token> tokens = tokenStream.getTokens();
        List<String> errors = new ArrayList<>();

        System.out.println("--- Tokens Found ---");
        for (Token token : tokens) {
            if (token.getType() == Token.EOF) {
                continue;
            }

            String tokenName = lexer.getVocabulary().getSymbolicName(token.getType());
            int line = token.getLine();
            int col = token.getCharPositionInLine();
            String text = token.getText();

            // Track lexical errors
            if (isErrorToken(tokenName)) {
                String errorMsg = getErrorMessage(tokenName, text);
                errors.add("Error at " + line + ":" + col + " Invalid or unexpected token: " + errorMsg + " [" + escape(text) + "]");
                continue;
            }

            // Standard Damascus University token output format:
            // Text: [lexeme] -> Type: TOKEN_TYPE (line:column)
            System.out.println("Text: [" + escape(text) + "] -> Type: " + tokenName + " (" + line + ":" + col + ")");
        }

        // Print Lexical Errors section
        System.out.println("\n--- Lexical Errors: " + errors.size() + " ---");
        if (errors.isEmpty()) {
            System.out.println("(No lexical errors found)");
        } else {
            for (String err : errors) {
                System.out.println(err);
            }
        }
    }

    private static boolean isErrorToken(String tokenName) {
        return tokenName != null && (tokenName.equals("UNCLOSED_STRING")
            || tokenName.equals("UNCLOSED_BLOCK_COMMENT")
            || tokenName.equals("UNEXPECTED_CHAR"));
    }

    private static String getErrorMessage(String tokenName, String text) {
        if ("UNCLOSED_STRING".equals(tokenName)) return "Unclosed string literal";
        if ("UNCLOSED_BLOCK_COMMENT".equals(tokenName)) return "Unclosed multi-line comment";
        return "Unexpected character '" + text + "'";
    }

    private static String escape(String s) {
        return s.replace("\r", "\\r").replace("\n", "\\n");
    }
}
