import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  await prisma.relazioni_Ottave.deleteMany({});
  await prisma.relazioni_Entita.deleteMany({});
  await prisma.vibrazioni.deleteMany({});
  await prisma.oscillazioni.deleteMany({});
  await prisma.flussi_Energetici.deleteMany({});
  await prisma.entita_Cosmiche.deleteMany({});
  await prisma.processi_Cosmici.deleteMany({});
  await prisma.eventi_Cosmici.deleteMany({});
  await prisma.ottave.deleteMany({});
  await prisma.forze.deleteMany({});
  await prisma.segmenti.deleteMany({});
  await prisma.leggi_Cosmiche.deleteMany({});
  await prisma.misure_Temporali.deleteMany({});
  await prisma.attributi_Dinamici.deleteMany({});
  await prisma.regioni_Cosmiche.deleteMany({});
  await prisma.simbologie_Esoteriche.deleteMany({});
  await prisma.cicli_Evolutivi.deleteMany({});
  await prisma.anomalie_Cosmiche.deleteMany({});

  console.log('Tutti i dati sono stati cancellati.');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
