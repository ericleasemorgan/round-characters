#!/usr/bin/env perl

# configure
use constant DIRECTORY => './necessary';
use constant LABEL     => 'necessary';

# require
use strict;

# initialize
my $counter   = 0;
my $directory = DIRECTORY;
my $label     = LABEL;

# process each sentence21
while ( <DATA> ) {

	# parse
	chop;
	my $sentence = $_;
	
	# increment
	$counter++;
	
	# re-initialize
	my $file = "$directory/$label-" . sprintf( "%04d", $counter ) . '.txt';
	
	# save sentence
	open OUTPUT, " > $file" or die "Can't open $file (!). Call Eric\n";
	print OUTPUT $sentence;
	close OUTPUT;

}

# done
exit;

__DATA__
She told the story, however, with great spirit among her friends
She mentioned this to her friend, Miss Lucas.
Her performance was pleasing, though by no means capital. 
Elizabeth at that instant moving towards them
Elizabeth looked archly, and turned away.
She did at last extort from her father an acknowledgment that the horses were engaged
She declared her resolution.
Elizabeth accepted their company, and the three young ladies set off together.
Elizabeth con-tinued her walk alone, crossing field after field at a quick pace, jumping over stiles and springing over puddles, with impatient activity, and finding herself at last within view of the house, with weary ankles, dirty stockings, and a face glowing'with the warmth of exercise.
Her inquiries after her sister were not very favourably answered.
Elizabeth silently attended her.
Elizabeth did not quit her room for a moment
she only wanted a little pressing to accept it
Elizabeth most thankfully consented
When dinner was over, she returned directly to Jane
She was still very poorly, and Elizabeth would not quit her at all
On entering the drawing-room, she found the whole party at loo, and was immediately in-vited to join them; but suspecting them to be playing high, she declined it, and making her sister the excuse, said she would amuse herself, for the short time she could stay below, with a book. 
Elizabeth thanked him from her heart, and then walked towards a table where a few books were lying.
Elizabeth assured him that she could suit herself perfectly with those in the room.
she drew near the card-table, and stationed herself between Mr. Bingley and his eldest sister, to observe the game.
As all con-versation was thereby at an end, Elizabeth soon afterwards left the room.
Elizabeth joined them again only to say that her sister was worse, and that she could not leave her.
This she would not hear of; but she was not so unwilling to comply with their brother's proposal
ELIZABETH passed the chief of the night in her sister's room,
In spite of this amendment, however, she requested to have a note sent to Longbourn, desiring her mother to visit Jane, and form her own judgment of her situation. 
Eliza-beth returned instantly to Jane, leaving her own and her relations' behaviour to the remarks of the two ladies and Mr. Darcy
in the evening, Elizabeth joined their party in the drawing-room
Miss Bingley moved with alacrity to the pianoforte, and after a polite request that Elizabeth would lead the way, which the other as politely and more earnestly negatived, she seated herself.
She smiled, but made no answer.
WHEN the ladies removed after dinner Elizabeth ran up to her sister, and seeing her well guarded from cold, attended her into the drawing-room
Elizabeth was surprised, but agreed to it immediately.
Elizabeth turned away to hide a smile.
In consequence of an agreement between the sisters, Eliza-beth wrote the next morning to her mother, to beg that the carriage might be sent for them in the course of the day.
Elizabeth took leave of the whole party in the liveliest spirits.
Jane and Elizabeth attempted to explain to her the nature of an entail.
They had often attempted it before
As they walked home, Elizabeth related to Jane what she had seen pass between the two gentlemen.
Elizabeth allowed that he had given a very rational account of it, and they continued talking together with mutual satisfaction till supper put an end to cards, and gave the rest of the ladies their share of Mr. Wickham's atten-tions. 
ELIZABETH related to Jane, the next day, what had passed between Mr. Wickham and herself. 
having told all her griefs to Charlotte Lucas, whom she had not seen for a week, she was soon able to make a voluntary transition to the od-dities of her cousin, and to point him out to her particular notice.
Eliza-beth made no answer, and took her place in the set,
They stood for some time without speaking a word
She said no more, and they went down the other dance and parted in silence
She then changed the discourse to one more gratifying to each, and on which there could be no difference of senti-ment.
On their being joined by Mr. Bingley himself, Elizabeth withdrew to Miss Lucas
Elizabeth tried hard to dissuade him from such a scheme ; assuring him that Mr. Darcy would consider his addressing him without introduction as an impertinent freedom, rather than a compliment to his aunt ; that it was not in the least necessary there should be any notice on either side, and that if it were, it must belong to Mr. Darcy, the superior in con- sequence, to begin the acquaintance.
In vain did Elizabeth endeavour to check the rapidity of her mother's words, or persuade her to describe her felicity in a less audible whisper
Elizabeth now began to revive.
She looked at Jane to see how she bore it
She looked at his two sisters, and saw them making signs of derision at each other, and at Darcy, who continued, however, impenetrably grave.
In vain did she entreat him to stand up with somebody else, and offered to introduce him to any young lady in the room. 
Elizabeth preserved as steady a silence as either Mrs. Hurst or Miss Bingley
And rising as she thus spoke, she would have quitted the room, had not Mr. Collins thus addressed her
Elizabeth could not but smile at such a conclusion of such a beginning
To such perseverance in wilful self-deception Elizabeth would make no reply, and immediately and in silence with-drew
Elizabeth sometimes with real earnestness, and sometimes with playful gaiety, replied to her attacks.
Elizabeth passed quietly out of the room
they had leisure for a full discussion of it, and for all the commenda-tions which they civilly bestowed on each other, as Wickham and another officer walked back with them to Longbourn, and during the walk he particularly attended to her.
Elizabeth saw her sister's countenance change as she read it, and saw her dwelling intently on some particular passages.
She represented to her sister, as forcibly as possible, what she felt on the subject
Elizabeth took an opportunity of thanking her. 
Elizabeth quietly answered 'undoubtedly; and, after an awkward pause, they returned to the rest of the family.
Elizabeth looked at her sister with incredulous solicitude, but said nothing
from this time Mr. Bingley's name was scarcely ever mentioned between them.
Elizabeth, having thanked her for the kindness of her hints, they parted
Elizabeth soon heard from her friend, and their correspondence was as regular and frequent as it ever had been
Elizabeth shook her head over this letter.
She was to accompany Sir William and his second daughter. 
The farewell between herself and Mr. Wickham was perfectly friendly; on his side even more.
Elizabeth then contrived to sit by her aunt.
Their first subject was her sister
But though every thing seemed neat and comfortable, she was not able to gratify him by any sigh of repentance; and rather looked with wonder at her friend, that she could have so cheerful an air with such a companion.
When Mr. Collins said any-thing of which his wife might reasonably be ashamed, which certainly was not seldoin, she involuntarily turned her eye on Charlotte.
Ab?ut the middle of the next day, as she was in her room getting ready for a walk, a sudden noise below seemed to speak the whole house in confusion; and, after listening a moment, she heard somebody running up stairs in a violent hurry, and calling loudly after her.
Elizabeth asked questions in vain
Elizabeth could hardly help smiling, as she assured her that had not been the case.
there were half hours of pleasant conversation with Charlotte, and the weather was so fine for the time of year, that she had often great enjoyment out of doors. 
Elizabeth had scarcely time to disclaim all right to the compliment before their approach was announced by the door-bell, and shortly afterwards the three gentlemen entered the room. 
Elizabeth merely courtesied to him, without saying a word.
She answered him in the usual way
they conversed with so much spirit and flow as to draw the atten-tion of Lady Catherine herself, as well as of Mr. Darcy.
When coffee was over, Colonel Fitzwilliam reminded Elizabeth of having promised to play to him ; and she sat down directly to the instrument.
Elizabeth saw what he was doing, and at the first con-venient pause turned to him with an arch smile, 
Elizabeth laughed heartily at this picture of herself
Elizabeth immediately began playing again. 
Elizabeth received them with all the for-bearance of civility
ELIZABETH was sitting by herself the next morning, and writing to Jane, while Mrs. Collins and Maria were gone on business into the village, when she was startled by a ring at the door, the certain signal of a visitor. 
They then sat down, and when her enquiries after Rosings were made, seemed in danger of sinking into total silence.
Elizabeth made no answer. 
she blushed as she answered
Elizabeth looked surprised. 
But when Elizabeth told of his silence, it did not seem very likely, even to Charlotte's wishes, to be the case ; and, after various conjectures, they could at last only suppose his visit to proceed from the difficulty of finding any thing to do, which was the more probable from the time of year.
She had once or twice suggested to Elizabeth the possi-bility of his being partial to her, but Elizabeth always laughed at the idea.
MORE than once did Elizabeth, in her ramble within the park, unexpectedly meet Mr. Darcy.
He never said a great deal, nor did she give herself the trouble of talking or of listening much 
She was engaged one day, as she walked, in re-perusing Jane's last letter, and dwelling on some passages which proved that Jane had not written in spirits, when, instead of being again surprised by Mr. Darcy, she saw, on looking up, that Colonel Fitzwilliam was meeting her.
Putting away the letter immediately, and forcing a smile
Elizabeth made no answer, and walked on
therefore, abruptly changing the conversa-tion, talked on indifferent matters till they reached the Parsonage. 
She answered him with cold civility.
Elizabeth was surprised, but said not a word.
She stared, coloured, doubted, and was silent.  
She had turned away ; but on hearing herself called, though in a voice which proved it to be Mr. Darcy, she moved again towards the gate. 
Pursuing her way along the lane, she then began it.
she walked on; but it would not do: in half a minute the letter was unfolded again
On Saturday morning Elizabeth and Mr. Collins met for breakfast a few minutes before the others appeared 
Elizabeth was eager with her thanks and assurances of happiness.
After an affectionate parting between the friends, Elizabeth was attended to the carriage by Mr. Collins
Elizabeth made no objection
Jane and Elizabeth looked at each other, and the waiter was told that he need not stay.
Elizabeth steadily opposed the scheme.
She then spoke of the letter, repeating the whole of its contents as far as they concerned George Wickham.
The elder Miss Bennets alone were still able to eat, drink, and sleep, and pursue the usual course of their employments.
In vain did Elizabeth attempt to make her reasonable, and Jane to make her resigned.
She represented to him all the improprieties of Lydia's gene-ral behaviour, the little advantage she could derive from the friendship of such a woman as Mrs. Forster, and the proba-bility of her being yet more imprudent with such a companion at Brighton, where the temptations must be greater than at home. 
Elizabeth was now to see Mr. Wickham for the last time.
Her answer was warmly in his favour.
Elizabeth could not repress a smile at this, but she answered only by a slight inclination of the head.
within five miles of Lambton, Elizabeth found, from her aunt, that Pemberley was situated. 
Elizabeth said no more;
Accordingly, when she retired at night, she asked the chambermaid whether Pemberley were not a very fine place, what was the name of its proprietor, and, with no little alarm, whether the family were down for the summer ?
when the subject was revived the next morning, and she was again applied to, could readily answer, and with a proper air of indifference, that she had not really any dislike to the scheme.
Elizabeth, after slightly surveying it, went to a window to enjoy its prospect.
she turned away with alarm, while Mrs. Reynolds replied, that he was
She ap-proached, and saw the likeness of Mr. Wickham, suspended, amongst several other miniatures, over the mantel-piece.
Mrs. Gardiner looked at her niece with a smile, but Eli-zabeth could not return it.
Elizabeth coloured
Elizabeth almost stared at her. 
She stood several minutes before the picture, in earnest contemplation, and returned to it again before they quitted the gallery.
As they walked across the lawn towards the river, Eli-zabeth turned back to look again
Their eyes instantly met, and the cheeks of each were overspread with the deepest blush. 
She had instinctively turned away; but stopping on his approach, received his compliments with an embarrassment impossible to be overcome.
to imitate his politeness, she began as they met to admire the beauty of the place
Her colour changed, and she said no more.
as she named their relationship to herself, she stole a sly look at him, to see how he bore it
Mr. Darcy took her place by her niece, and they walked on together. 
After a short silence the lady first spoke. 
Elizabeth answered only by a slight bow.
They now walked on in silence
They soon outstripped the others; and when they had reached the carriage, Mr. and Mrs. Gardiner were half a quarter of a mile behind.
He then asked her to walk into the houseóbut she de-clared herself not tired, and they stood together on the lawn.
At last she recol-lected that she had been travelling, and they talked of Matlock and Dovedale with great perseverance. 
Mr. Darcy handed the ladies into the carriage, and when it drove off, Elizabeth saw him walking slowly towards the house.
Elizabeth excused herself as well as she could : said that she had liked him better when they met in Kent than be-fore, and that she had never seen him so pleasant as this morning.
therefore, gave them to understand, in as guarded a manner as she could, that by what she had heard from his relations in Kent, his actions were capable of a very different construc-tion; and that his character was by no means so faulty, nor Wickham's so amiable, as they had been considered in Hert-fordshire. 
In confirmation of this, she related the par-ticulars of all the pecuniary transactions in which they had been connected, without actually naming her authority, but stating it to be such as might be relied on.
she had barely time to express her satisfaction, and prepare for such a visitor, when Bingley's quick step was heard on the stairs, and in a moment he entered the room.
It was not often that she could turn her eyes on Mr. Darcy himself
Mrs. Gardiner looked at her niece, desirous of knowing how she, whom the invitation most concerned, felt disposed as to its acceptance, but Elizabeth had turned away her head.
on their being seated, a pause, awkward as such pauses must always be, succeeded for a few mo-ments.
She answered with equal indifference and brevity, and the other said no more.
Their visit did not continue long after the question and answer above mentioned
Mrs. Gardiner and Elizabeth talked of all that had occurred during their visit, as they returned, except what had particu-larly interested them both. 
They had just been preparing to walk as the letters came in 
Elizabeth, on finishing this letter, instantly seized the other, and opening it with the utmost impatience, read as follows
Calling back the servant, therefore, she com-missioned him, though in so breathless an accent as made her almost unintelligible, to fetch his master and mistress home instantly.
She burst into tears as she alluded to it, and for a few minutes could not speak another word. 
At length she spoke again. 
satisfy-ing them instantly on that head, she eagerly communicated the cause of their summons, reading the two letters aloud, and dwelling on the postscript of the last with trembling energy
Elizabeth, though expecting no less, thanked him with tears of gratitude
she had her share of business as well as her aunt, and amongst the rest there were notes to be written to all their friends at Lambton, with false excuses for their sudden departure.
They travelled as expeditiously as possible; and sleeping one night on the road, reached Longbourn by dinner-time the next day.
Elizabeth jumped out; and after giving each of them a hasty kiss, hurried into the vestibule, where Jane, who came running down stairs from her mother's apartment, imme-diately met her.
Elizabeth, as she affectionately embraced her, whilst tears filled the eyes of both, lost not a moment in asking whether any thing had been heard of the fugitives.
their conversation, which had been passing while Mr. and Mrs. Gardiner were engaged with their children, was now put an end to by the approach of the whole party.
Elizabeth lifted up her eyes in amazement, but was too much oppressed to make any reply. 
In the afternoon, the two elder Miss Bennets were able to be for half an hour by themselves; and Elizabeth instantly availed herself of the opportunity of making any enquiries which Jane was equally eager to satisfy.
She then proceeded to enquire into the measures which her father had intended to pursue, while in town, for the recovery of his daughter.
It was not till the afternoon, when he joined them at tea, that Elizabeth ventured to introduce the subject
Two days after Mr. Bennet's return, as Jane and Elizabeth were walking together in the shrubbery behind the house, they saw the housekeeper coming towards them, and con-cluding that she came to call them to their mother, went forward to meet her
They ran through the vestibule into the breakfast-room ; from thence to the library;ótheir father was in neither; and they were on the point of seeking him up stairs with their mother, when they were met by the butler
Upon this information, they instantly passed through the hall once more, and ran across the lawn after their father, who was deliberately pursuing his way towards a small wood on one side of the paddock.
Jane, who was not so light, nor so much in the habit of running as Elizabeth, soon lagged behind, while her sister, panting for breath, came up with him
Elizabeth impatiently caught it from his hand.
They went to the library, therefore, and asked their father whether he would not wish them to make it known to her.
Elizabeth took the letter from his writing-table, and they went up stairs together.
She blushed, and Jane blushed
Eliza-beth looked expressively at Lydia
She got up and ran out of the room; and returned no more, till she heard them passing through the hall to the dining parlour.
On such encouragement to ask, Elizabeth was forced to put it out of her power, by running away.
She was no sooner in possession of it, than hurrying into the little copse, where she was least likely to be interrupted, she sat down on one of the benches, and prepared to be happy
She read over her aunt's commendation of him again and again.
She replied in the affirmative.
She held out her hand
Elizabeth, to satisfy her mother, went to the windowóshe looked- she saw Mr. Darcy with him, and sat down again by her sister.
Elizabeth said as little to either as civility would allow, and sat down again to her work, with an eagerness which it did not often command.
She had ventured only one glance at Darcy. 
Elizabeth, with a triumphant sensation, looked towards his friend.
Elizabeth smiled.
Elizabeth made no attempt to reason with her mother, but remained quietly in the hall till she and Kitty were out of sight, then returned into the drawing-room.
Elizabeth, who had a letter to write, went into the breakfast-room for that purpose soon after tea 
Elizabeth's congratulations were given with a sincerity, a warmth, a delight, which words could but poorly express.
Elizabeth honestly and heartily expressed her delight in the prospect of their relationship. 
Elizabeth had mentioned her name to her mother on her Ladyship's entrance, though no request of introduc-tion had been made.
Elizabeth replied very concisely that she was.
Elizabeth obeyed; and, running into her own room for her parasol, attended her noble guest down stairs.
Elizabeth looked with unaffected astonishment.
And she rose as she spoke.
Elizabeth made no answer; and without attempting to persuade her Ladyship to return into the house, walked quietly into it herself.
She heard the carriage drive away as she proceeded up stairs.
