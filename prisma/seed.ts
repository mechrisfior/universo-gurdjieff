import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // Creazione delle tre forze
  const forzaAttiva = await prisma.forza.create({
    data: {
      nome: 'Forza Attiva',
      descrizione: 'La forza che inizia ogni azione, collegata alla creatività e al movimento.',
      tipo: 'Attiva',
    },
  });

  const forzaPassiva = await prisma.forza.create({
    data: {
      nome: 'Forza Passiva',
      descrizione: 'La forza che riceve e forma, associata alla stabilità e all’integrazione.',
      tipo: 'Passiva',
    },
  });

  const forzaNeutralizzante = await prisma.forza.create({
    data: {
      nome: 'Forza Neutralizzante',
      descrizione: 'La forza che armonizza le altre due, creando equilibrio e coerenza.',
      tipo: 'Neutralizzante',
    },
  });

  // Creazione delle tre attenzioni
  const primaAttenzione = await prisma.attenzione.create({
    data: {
      nome: 'Prima Attenzione',
      descrizione: 'Focalizzazione sul mondo esterno e sui dettagli immediati.',
      livello: 1,
    },
  });

  const secondaAttenzione = await prisma.attenzione.create({
    data: {
      nome: 'Seconda Attenzione',
      descrizione: 'Consapevolezza riflessiva, rivolta all’interiorità e alla comprensione più profonda.',
      livello: 2,
    },
  });

  const terzaAttenzione = await prisma.attenzione.create({
    data: {
      nome: 'Terza Attenzione',
      descrizione: 'Stato di consapevolezza totale, collegamento tra tutte le cose.',
      livello: 3,
    },
  });

  // Creazione delle ottave principali
  const ottavaCosmica = await prisma.ottava.create({
    data: {
      nome: 'Ottava Cosmica',
      descrizione: 'L’ottava che rappresenta l’intero universo e le sue leggi.',
      frequenzaIniziale: 256.0,
      frequenzaFinale: 512.0,
      forzaId: forzaAttiva.id,
    },
  });

  const ottavaSolare = await prisma.ottava.create({
    data: {
      nome: 'Ottava Solare',
      descrizione: 'L’ottava che rappresenta il sistema solare, sottoinsieme dell’ottava cosmica.',
      frequenzaIniziale: 512.0,
      frequenzaFinale: 1024.0,
      forzaId: forzaNeutralizzante.id,
    },
  });

  const ottavaTerrestre = await prisma.ottava.create({
    data: {
      nome: 'Ottava Terrestre',
      descrizione: 'L’ottava che rappresenta la Terra e tutte le sue dinamiche.',
      frequenzaIniziale: 1024.0,
      frequenzaFinale: 2048.0,
      forzaId: forzaPassiva.id,
    },
  });

  // Collegare le ottave con le scale
  const scalaCosmica = await prisma.scala.create({
    data: {
      nome: 'Scala Cosmica',
      descrizione: 'La scala principale che regola l’intero universo.',
      livello: 1,
      ottavaId: ottavaCosmica.id,
    },
  });

  const scalaSolare = await prisma.scala.create({
    data: {
      nome: 'Scala Solare',
      descrizione: 'Scala che regola il sistema solare.',
      livello: 2,
      ottavaId: ottavaSolare.id,
      scalaPadreId: scalaCosmica.id,
    },
  });

  const scalaTerrestre = await prisma.scala.create({
    data: {
      nome: 'Scala Terrestre',
      descrizione: 'Scala che regola la Terra.',
      livello: 3,
      ottavaId: ottavaTerrestre.id,
      scalaPadreId: scalaSolare.id,
    },
  });

  // Creazione di centri e parti di centri
  const centroIntellettuale = await prisma.centro.create({
    data: {
      nome: 'Centro Intellettuale',
      descrizione: 'Centro responsabile del pensiero e della razionalità.',
      scalaId: scalaTerrestre.id,
    },
  });

  const parteRazionale = await prisma.parteCentro.create({
    data: {
      nome: 'Parte Razionale',
      descrizione: 'Parte del Centro Intellettuale dedicata alla logica e alla ragione.',
      centroId: centroIntellettuale.id,
    },
  });

  const sottoParteMemoria = await prisma.parteParte.create({
    data: {
      nome: 'Sotto Parte Memoria',
      descrizione: 'Parte della Parte Razionale dedicata alla memoria.',
      parteCentroId: parteRazionale.id,
    },
  });

  const centroEmotivo = await prisma.centro.create({
    data: {
      nome: 'Centro Emotivo',
      descrizione: 'Centro responsabile delle emozioni e dei sentimenti.',
      scalaId: scalaTerrestre.id,
    },
  });

  const parteSentimentale = await prisma.parteCentro.create({
    data: {
      nome: 'Parte Sentimentale',
      descrizione: 'Parte del Centro Emotivo dedicata alle emozioni profonde.',
      centroId: centroEmotivo.id,
    },
  });

  // Creazione di vibrazioni nelle ottave
  await prisma.vibrazione.createMany({
    data: [
      {
        frequenza: 256.0,
        ottavaId: ottavaCosmica.id,
      },
      {
        frequenza: 512.0,
        ottavaId: ottavaSolare.id,
      },
      {
        frequenza: 1024.0,
        ottavaId: ottavaTerrestre.id,
      },
    ],
  });

  // Creazione delle carte per ogni ottava
  await prisma.carta.createMany({
    data: [
      {
        nome: 'Carta 1 della Ottava Cosmica',
        descrizione: 'Carta che rappresenta il primo aspetto dell’Ottava Cosmica.',
        posizione: 1,
        ottavaId: ottavaCosmica.id,
      },
      {
        nome: 'Carta 2 della Ottava Cosmica',
        descrizione: 'Carta che rappresenta il secondo aspetto dell’Ottava Cosmica.',
        posizione: 2,
        ottavaId: ottavaCosmica.id,
      },
      {
        nome: 'Carta 1 della Ottava Solare',
        descrizione: 'Carta che rappresenta il primo aspetto dell’Ottava Solare.',
        posizione: 1,
        ottavaId: ottavaSolare.id,
      },
      {
        nome: 'Carta 2 della Ottava Solare',
        descrizione: 'Carta che rappresenta il secondo aspetto dell’Ottava Solare.',
        posizione: 2,
        ottavaId: ottavaSolare.id,
      },
      {
        nome: 'Carta 1 della Ottava Terrestre',
        descrizione: 'Carta che rappresenta il primo aspetto dell’Ottava Terrestre.',
        posizione: 1,
        ottavaId: ottavaTerrestre.id,
      },
      {
        nome: 'Carta 2 della Ottava Terrestre',
        descrizione: 'Carta che rappresenta il secondo aspetto dell’Ottava Terrestre.',
        posizione: 2,
        ottavaId: ottavaTerrestre.id,
      },
    ],
  });

  // Creazione di riferimenti temporali per collegare il tempo reale alla scala cosmica
  await prisma.tempoReale.createMany({
    data: [
      {
        nome: 'Inizio del Ciclo Cosmico',
        tempoReale: new Date(2000, 0, 1),  // 1 gennaio 2000
        scalaId: scalaCosmica.id,
      },
      {
        nome: 'Inizio del Ciclo Solare',
        tempoReale: new Date(2020, 0, 1),  // 1 gennaio 2020
        scalaId: scalaSolare.id,
      },
      {
        nome: 'Inizio del Ciclo Terrestre',
        tempoReale: new Date(2024, 0, 1),  // 1 gennaio 2024
        scalaId: scalaTerrestre.id,
      },
    ],
  });

  console.log('Seed completato con successo!');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
