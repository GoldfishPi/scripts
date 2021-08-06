const authorization="Bearer BQCtZBFBlEkfklt1UbmOWLr9-CPf_3h3RRQA2skSkLepfHdU8LLL97uf-w9vem8Mm_yYvW3HJd7axKL5ZjJUhhQiGIGtnPaWsUe5hTnt2ghKyi2swPk5dqGBBXnMjgpzEjv939orHc7V13V-KAwiLoYTyEdkFn-dAFHSfwGeK-eaWbnPDm6EYKXMMapktGsB0GGQP1e-MV1rkPakl1lj0XPxS2tslyxkVeCf8I0XhKUf_XRzB4TYOD0X3FAUWyLqm_SMexG7pJ--92EwJOI0PTbe6lEWuwy3UkjE5EAR";

let counter = 0;
let urls:string[] = [];
while(true) {
	const url=`https://api.spotify.com/v1/me/albums?limit=50&offset=${counter * 50}&market=from_token`;
	console.log('fetching more data');
	const res = await fetch(url, {
		headers:{
			authorization
		}
	});
	const data = await res
		.json();
	if(data.items.length === 0) break;
	urls = [
		...urls,
		...data.items.map((item:any) => item.album.external_urls.spotify),
	]
	counter ++;
};
console.log('got all the good good urls');
Deno.writeFile('spotifyurls', new TextEncoder().encode(urls.join(' ')));


// await Deno.run({
// 	cmd:['spotdl', '-o ~/music', ...urls ]
// })
// Deno.run({ cmd :['spotdl', '--help', '|', 'echo']});

// console.log('wow', urls);


// touch ~/spotify.json

// curl $url --header "$headers" >> ~/spotify.json

