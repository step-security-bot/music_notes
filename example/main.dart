// ignore_for_file: unnecessary_statements, cascade_invocations

import 'package:music_notes/music_notes.dart';

void main() {
  // Notes
  Note.c; // C
  Note.d; // D
  Note.f; // F

  Note.c.sharp; // C♯
  Note.d.flat; // D♭
  Note.g.flat.flat; // G𝄫
  Note.f.sharp.sharp.sharp; // F𝄪♯

  Note.f.inOctave(4); // F4
  Note.b.flat.inOctave(5); // B♭5

  Note.parse('a#'); // A♯
  PositionedNote.parse("g''"); // G5
  PositionedNote.parse('Eb3'); // E♭3

  // Intervals
  const Interval.perfect(15, PerfectQuality.perfect); // P15
  Interval.P4; // P4

  -Interval.P4; // desc P4
  Interval.M3.descending(); // desc M3

  Note.c.interval(Note.g); // P5
  Note.d.interval(Note.f.sharp).inverted; // m6
  Note.g.flat.transposeBy(-Interval.m3); // E♭

  Interval.P5.circleFrom(Note.c, distance: 12);
  // [C, G, D, A, E, B, F♯, C♯, G♯, D♯, A♯, E♯, B♯]
  Note.c.circleOfFifths();
  // (flats: [F, B♭, E♭, A♭, D♭, G♭], sharps: [G, D, A, E, B, F♯])

  // Tonalities
  const Tonality(Note.e, TonalMode.minor); // E minor
  Note.a.flat.major; // A♭ major

  Note.d.major.keySignature; // 2 (F♯ C♯)
  Note.e.flat.minor.keySignature; // -6 (B♭ E♭ A♭ D♭ G♭ C♭)

  Note.d.major.relative; // B minor
  Note.c.minor.relative; // E♭ major

  // Key signatures
  KeySignature([Note.b.flat, Note.e.flat]); // 2 (B♭ E♭)
  KeySignature.fromDistance(4); // 4 (F♯ C♯ G♯ D♯)

  KeySignature([Note.f.sharp]).tonalities.major; // G major
  KeySignature.fromDistance(-3).tonalities.minor; // C minor

  // Modes
  TonalMode.minor.scale; // ScalePattern.minor
  ModalMode.locrian.scale; // ScalePattern.locrian

  ModalMode.lydian.brightness; // 3
  ModalMode.dorian.brightness; // 0
  ModalMode.aeolian.brightness; // -1

  ModalMode.ionian.mirrored; // ModalMode.phrygian
  ModalMode.aeolian.mirrored; // ModalMode.mixolydian

  // Scales
  ScalePattern.lydian.on(Note.d); // D Lydian (D E F♯ G♯ A B C♯ D)
  ScalePattern.wholeTone.on(Note.f); // F Whole-tone (F G A B C♯ D♯ F)
  ScalePattern.majorPentatonic.on(Note.g.flat);
  // G♭ Major pentatonic (G♭ A♭ B♭ D♭ E♭ G♭)

  Note.a.flat.major.scale; // A♭ Major (ionian) (A♭ B♭ C D♭ E♭ F G A♭)
  Note.d.minor.scale; // D Natural minor (aeolian) (D E F G A B♭ C D)

  ScalePattern.lydian.on(Note.e).degree(ScaleDegree.iv); // A♯
  Note.c.major.scale.functionChord(
    HarmonicFunction.dominantV / HarmonicFunction.dominantV,
  ); // D maj. (D F♯ A)

  // Chords
  Chord([Note.a, Note.c.sharp, Note.e]); // A maj. (A C♯ E)
  ChordPattern.augmentedTriad.add11().add13().on(Note.d.sharp);
  // D♯ aug. (D♯ F𝄪 A𝄪 G♯ B♯)

  Note.f.minorTriad.add7().add9(ImperfectQuality.minor);
  // F min. (F A♭ C E♭ G♭)
  Note.e.flat.diminishedTriad.add7().transposeBy(Interval.m2);
  // F♭ dim. (F♭ A𝄫 C𝄫 E𝄫)

  Note.g.minorTriad.major; // G maj. (G B D)
  Note.f.sharp.majorTriad.add9().diminished; // F♯ dim. (F♯ A C G♯)

  // Frequencies
  Note.a.inOctave(4).frequency(); // 440.0 Hz
  Note.b.flat.inOctave(4).frequency(
        referenceNote: Note.c.inOctave(4),
        referenceFrequency: const Frequency(256),
      ); // 456.1401436878537 Hz

  const Frequency(415).closestPositionedNote();
  // (G♯4, cents: -1.2706247484469828, hertz: -0.3046975799451275)

  Note.c
      .inOctave(1)
      .frequency()
      .harmonics(upToIndex: 15)
      .map((frequency) => frequency.closestPositionedNote().displayString())
      .toSet();
  // {C1, C2, G2+2, C3, E3-14, G3+2, A♯3-31, C4, D4+4, E4-14, F♯4-49, G4+2,
  // A♭4+41, A♯4-31, B4-12, C5}

  // In a nutshell
  ScalePattern.lydian // Lydian (M2 M2 M2 m2 M2 M2 m2)
      .on(Note.parse('a')) // A Lydian (A B C♯ D♯ E F♯ G♯ A)
      .transposeBy(Interval.M2) // B Lydian (B C♯ D♯ E♯ F♯ G♯ A♯ B)
      .degree(ScaleDegree.iii) // D♯
      .respelledUpwards // E♭
      .major // E♭ major
      .relative // C minor
      .scale // C Natural minor (aeolian) (C D E♭ F G A♭ B♭ C)
      .degreeChord(ScaleDegree.v) // G min. (G B♭ D)
      .add9(); // G min. (G B♭ D A)
}
