open Core

(* Let's define a morpheme recursively *)
type morpheme =
  | SingleMorpheme of char
  | DoubleMorpheme of char * char
  | TripleMorpheme of char * char * char
  | QuadrupleMorpheme of char * char * char

type word = Multimorpheme of morpheme list

type line = L of word list

type corpus = C of line list

(*Get a random token that isn't in our exclusionary list *)
let rec random_token exclude_lst =
  let rand_char = Char.chr (Random.int 200) in
  match (List.mem rand_char exclude_lst) with
  | true -> random_token exclude_lst
  | false -> rand_char
