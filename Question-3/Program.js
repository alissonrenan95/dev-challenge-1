function menorFaturamento(faturamentos) {
  if (faturamentos.length > 0) {
    return faturamentos.sort((a, b) => a - b)[0];
  }
  return 0;
}

function maiorFaturamento(faturamentos) {
  if (faturamentos.length > 0) {
    return faturamentos.sort((a, b) => a - b)[faturamentos.length - 1];
  }
  return 0;
}

function mediaFaturamento(faturamentos) {
  return (
    faturamentos.reduce((a, b) => a + b, 0) /
    (faturamentos.filter((faturamento) => faturamento > 0).length || 1)
  );
}

function quantidadeDiasAcimaDaMediaFaturamento(faturamentos) {
  return faturamentos.filter(
    (faturamento) => faturamento > mediaFaturamento(faturamentos)
  ).length;
}

const faturamentos = Array.from({ length: 365 }).map(
  () => Math.random() * 1000 * 1000
);

function main() {
  console.log(`Menor faturamento: ${menorFaturamento(faturamentos)}`);
  console.log(`Maior faturamento: ${maiorFaturamento(faturamentos)}`);
  console.log(
    `Quantidade de dias com faturamento superior a média(${mediaFaturamento(
      faturamentos
    )}): ${quantidadeDiasAcimaDaMediaFaturamento(faturamentos)}`
  );
}

main();
