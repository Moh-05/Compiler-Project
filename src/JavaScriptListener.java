// Generated from src/JavaScript.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link JavaScriptParser}.
 */
public interface JavaScriptListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(JavaScriptParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(JavaScriptParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(JavaScriptParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(JavaScriptParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void enterVarDecl(JavaScriptParser.VarDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void exitVarDecl(JavaScriptParser.VarDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#ifStmt}.
	 * @param ctx the parse tree
	 */
	void enterIfStmt(JavaScriptParser.IfStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#ifStmt}.
	 * @param ctx the parse tree
	 */
	void exitIfStmt(JavaScriptParser.IfStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#returnStmt}.
	 * @param ctx the parse tree
	 */
	void enterReturnStmt(JavaScriptParser.ReturnStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#returnStmt}.
	 * @param ctx the parse tree
	 */
	void exitReturnStmt(JavaScriptParser.ReturnStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#exprStmt}.
	 * @param ctx the parse tree
	 */
	void enterExprStmt(JavaScriptParser.ExprStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#exprStmt}.
	 * @param ctx the parse tree
	 */
	void exitExprStmt(JavaScriptParser.ExprStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#blockStmt}.
	 * @param ctx the parse tree
	 */
	void enterBlockStmt(JavaScriptParser.BlockStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#blockStmt}.
	 * @param ctx the parse tree
	 */
	void exitBlockStmt(JavaScriptParser.BlockStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StringExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterStringExpr(JavaScriptParser.StringExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StringExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitStringExpr(JavaScriptParser.StringExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TrueExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTrueExpr(JavaScriptParser.TrueExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TrueExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTrueExpr(JavaScriptParser.TrueExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(JavaScriptParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(JavaScriptParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code RelationalExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterRelationalExpr(JavaScriptParser.RelationalExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code RelationalExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitRelationalExpr(JavaScriptParser.RelationalExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpr(JavaScriptParser.UnaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpr(JavaScriptParser.UnaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AssignExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAssignExpr(JavaScriptParser.AssignExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AssignExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAssignExpr(JavaScriptParser.AssignExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code FalseExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterFalseExpr(JavaScriptParser.FalseExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code FalseExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitFalseExpr(JavaScriptParser.FalseExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code NullExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNullExpr(JavaScriptParser.NullExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code NullExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNullExpr(JavaScriptParser.NullExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code EqualityExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterEqualityExpr(JavaScriptParser.EqualityExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code EqualityExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitEqualityExpr(JavaScriptParser.EqualityExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code MulDivExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMulDivExpr(JavaScriptParser.MulDivExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code MulDivExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMulDivExpr(JavaScriptParser.MulDivExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code NumExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNumExpr(JavaScriptParser.NumExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code NumExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNumExpr(JavaScriptParser.NumExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TemplateExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTemplateExpr(JavaScriptParser.TemplateExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TemplateExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTemplateExpr(JavaScriptParser.TemplateExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ParenExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParenExpr(JavaScriptParser.ParenExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ParenExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParenExpr(JavaScriptParser.ParenExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code LogicalExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLogicalExpr(JavaScriptParser.LogicalExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code LogicalExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLogicalExpr(JavaScriptParser.LogicalExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AddSubExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAddSubExpr(JavaScriptParser.AddSubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AddSubExpr}
	 * labeled alternative in {@link JavaScriptParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAddSubExpr(JavaScriptParser.AddSubExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link JavaScriptParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(JavaScriptParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link JavaScriptParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(JavaScriptParser.NumberContext ctx);
}