# ----------------------------------------------------------------------------
# Mostra a programação da Rede Globo do dia.
# Uso: zzglobo
# Ex.: zzglobo
#
# Autor: Vinícius Venâncio Leite <vv.leite (a) gmail com>
# Desde: 2007-11-30
# Versão: 6
# Licença: GPL
# Requisitos: zztrim
# ----------------------------------------------------------------------------
zzglobo ()
{
	zzzz -h globo "$1" && return

	local url="http://vejonatv.com.br/programacao/globo-rede.html"

	$ZZWWWDUMP -assume_charset=utf-8 "$url" |
		sed -n "/Hoje \[[0-9]*\-[0-9]*\-[0-9]*\]/,/Amanhã .*/p" |
		sed '$d ; /Carregando\.\.\./d' |
		uniq |
		zztrim
}
