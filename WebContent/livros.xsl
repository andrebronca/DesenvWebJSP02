<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Utilizando XML com XSLT</title>
				<style>
					.alternado{background-color:#ffd700}
					.titulo{background-color:#f8f8ff}
				</style>
			</head>
			<body>
				<table border="1">
					<tr>
						<th colspan="4">Livros Cadastrados</th>
					</tr>
					<tr class="titulo">
						<th>ISBN</th>
						<th>Titulo</th>
						<th>Edicaoo</th>
						<th>Publicacao</th>
					</tr>
					<xsl:for-each select="livros/livro">
						<xsl:element name="tr">
							<xsl:if test="(position() mod 2 = 1)">
								<xsl:attribute name="class">
									alternado
								</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="isbn" />
							</td>
							<td>
								<xsl:value-of select="titulo" />
							</td>
							<td align="center">
								<xsl:value-of select="edicao" />
							</td>
							<td align="center">
								<xsl:value-of select="publicacao" />
							</td>
						</xsl:element>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>