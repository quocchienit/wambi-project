@extends('frontend.layout')
@section('content')
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
        }
    </style>
    <div class="row comment-new">
        <div class="col-md-6 col-xs-12" style="border-right: 2px solid #0099FF">
            <div class="imgoutpatient">
                <img src="{{ url("/assets/images/survey/outpatient.png") }}" alt="" class="img-responsive">
            </div>
            <div class="skip hidden-mobile">
                <a href="/survey/thanks-completed"><span>Skip</span> <i class="ion-arrow-right-c"></i></a>
            </div>
            <div class="button_and_or hidden-xs hidden-sm">
                <button>AND / OR</button>
            </div>
            <div class="comment-box">
                <form class="form-horizontal group-border-dashed" action="{{route('survey::comment') }}" method="post"
                      accept-charset="utf-8">
                    {!! csrf_field() !!}
                    <div class="form-group text-center title-comment">
                        <h3 class="title text-center">Want to share more?</h3>
                        <p class="text-center content">Enter any additional comments you have here</p>
                    </div>
                    <div class="form-group comment-textarea">
                        <textarea rows="20" name="comment" type="text" class="text-comment"
                                  placeholder="Everything you share here will remain anonymous unless you select to be contacted below..."></textarea>
                    </div>
                    <div class="form-group comment-footer">
                        <div class="switchery-demo">
                            <input type="checkbox" name="contact" data-plugin="switchery" data-color="#4c5667"
                                   data-size="small" id="info">
                            <lable style="color: #000000;">&emsp;@lang('survey.check_box_contact')</lable>
                        </div>
                        <div class="visiabled" style="display:none;">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <input type="text" name="firstname" parsley-trigger="change"
                                           placeholder="First Name" class="form-control text-name">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="lastname" parsley-trigger="change" placeholder="Last Name"
                                           class="form-control text-name">
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <div class="col-sm-12">
                                    <input type="text" name="phonenumber" placeholder="Phone Number"
                                           class="form-control text-info">
                                    <p>@lang('survey.Or')</p>
                                    <input type="text" parsley-trigger="change" name="email" data-parsley-type="email"
                                           name="email" type="text" placeholder="Email" class="form-control">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary waves-effect waves-light"
                                type="submit">@lang('survey.SUBMIT')</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="skip hidden-desktop">
                <a href="/survey/thanks-completed"><span>Skip</span> <i class="ion-arrow-right-c"></i></a>
            </div>
            <div class="comment-box">
                <form class="form-horizontal" accept-charset="utf-8">
                    <div class="form-group text-center">
                        <h3 class="title text-center">Feeling grateful?</h3>
                        <p class="text-center content">Write your Care provider a Carepostcard!</p>
                    </div>
                    <div class="form-group comment-letter" id="contentLetter">
                        <div class="col-md-7 col-sm-7 col-xs-7 hg-nopad-right">
                            <div class="block-input">
                                <textarea id="caregiver_content" required name="content" placeholder="Example text:

Thank you for providing me with compassionate care. I am grateful for your kind approach and gentles. You are very special to our family.">{!! old('content') !!}</textarea>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-5 center-content">
                            <div class="block-display">
                                <img src="{{ url('http://dev.carepostcards.com/storage/media/stamp-icon-1491150043.png') }}"
                                     alt="" class="heart-letter">
                                <div class="doctor-name block-space" style="text-transform: capitalize;">
                                    <label style="font-weight: normal" for="">To: </label><input readonly id="to"
                                                                                                 name="to"
                                                                                                 class="placeholder-style"
                                                                                                 type="text"
                                                                                                 placeholder="Shirley Simmons"
                                                                                                 value="{{ $employee?$employee->firstname:'' }} {{$employee?$employee->lastname:''}}">
                                </div>
                                <div class="doctor-address block-space" style="text-transform: capitalize; padding-bottom: 10px;font-weight: bold">
                                    {!! $unit_data?$unit_data->value:'' !!}
                                </div>
                                <div class="doctor-address block-space" style="text-transform: capitalize; padding: 0;">
                                    {!! $unit_data?$unit_data->address:'' !!}
                                </div>
                                <input id="address" type="hidden" value="{!! $unit_data?$unit_data->address:'' !!}">
                                <div class="from-who block-space">
                                    <label style="font-weight: normal" for="">From:</label><input id="from" name="from"
                                                                                                  class="placeholder-style"
                                                                                                  type="text"
                                                                                                  placeholder="One Grateful Patient" value="" style="color: #666666;">
                                </div>
                            </div>
                        </div>
                        <div class="date-display"
                             style="text-transform: capitalize;">{{ gmdate("F j, Y", time()) }}</div>
                    </div>
                    <div class="form-group comment-footer-2">
                        <div class="footer-content">
                            <p>*This Carepostcard will be <b>posted publically</b> on carepostcard.com</p>
                        </div>
                        <a class="btn btn-primary waves-effect waves-light btn-step1-submit">@lang('survey.SUBMIT')</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{--<div class="modal fade" id="email_modal" role="dialog" tabindex="-1">--}}
        {{--<div class="modal-dialog">--}}
            {{--<div class="modal-content">--}}
                {{--<button id="close_modal_1" type="button" class="close" data-dismiss="modal">&times;</button>--}}
                {{--<div class="modal-body">--}}
                    {{--{!! csrf_field() !!}--}}
                    {{--<input type="hidden" id="caregiver_content_after" name="caregiver_content" value="">--}}
                    {{--<input type="hidden" id="from_after" name="from" value="">--}}
                    {{--<input type="hidden" id="to_after" name="to" value="">--}}
                    {{--<div class="step-3-title">Step 3: <span>Almost done!</span></div>--}}
                    {{--<div class="send-line" style="margin-top: 15px; text-align: center; font-size: 16px; color: #0090f5;">--}}
                        {{--The law requires that you accept<br>--}}
                        {{--our teams and conditions and<br>--}}
                        {{--Privacy Policy:--}}
                    {{--</div>--}}
                    {{--<div class="term-condition">--}}
                        {{--<div class="checkbox">--}}
                            {{--<label>--}}
                                {{--<input type="checkbox" value="" id="accept-check" checked="checked" required>--}}
                                {{--<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>--}}
                            {{--</label>--}}
                        {{--</div>--}}
                        {{--<p class="accept-text">I accept <a class="term-of-user" href="#" data-toggle="modal"--}}
                                                           {{--data-target="#term-modal">Terms of Service</a> and have--}}
                            {{--read the <a class="privacy-policy-button" href="#" data-toggle="modal"--}}
                                        {{--data-target="#privacy-modal">Privacy policy</a></p>--}}
                    {{--</div>--}}
                    {{--<a href="javascript:void(0)" id="btnSave" class="submit-button buttonload" style="padding: 8px;"><i--}}
                                {{--style="display: none;" id="buttonloading" class="fa fa-spinner fa-spin"></i> Send</a>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
    <div class="modal fade" id="email_modal" role="dialog" tabindex="-1" style="margin-top: 20px;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <button id="close_modal_new" type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-body">
                    {!! csrf_field() !!}
                    <input type="hidden" id="caregiver_content_after" name="caregiver_content" value="">
                    <input type="hidden" id="from_after" name="from" value="">
                    <input type="hidden" id="to_after" name="to" value="">
                    <div class="step-3-title"><span>Almost done!</span></div>
                    <h3 style="font-size: 16px; color: #F71749; text-align: center;">Remember: Your Carepostcard will be made public on carepostcard.com</h3>
                    <div class="send-line" style="margin-top: 15px; text-align: center; height: 50vh; overflow-x: hidden; overflow-y: scroll; padding: 10px; border: 1px solid gray;">
                    {{--DD START--}}
                        <P class="p2 ft2">Terms of Service</P>
                        <P class="p3 ft4"><SPAN class="ft3">Last Updated on May 5, 2017</SPAN>. These terms and conditions are effective immediately for those registering accounts after that date and will become effective June 5, 2017 for those with pre- existing accounts.</P>
                        <P class="p4 ft4">These terms and conditions (the <SPAN class="ft3">"Terms"</SPAN>) govern your access to and use of carepostcard’s websites and mobile applications that link to or reference these Terms (<SPAN class="ft3">"Site"</SPAN>). By accessing or using the Site, you are agreeing to these Terms and concluding a legally binding contract with carepostcard, LLC a Florida limited liability corporation headquartered in Woodland Hills, CA (<SPAN class="ft3">"carepostcard"</SPAN>). Do not access or use the Site if you are unwilling or unable to be bound by the Terms.</P>
                        <P class="p5 ft6"><SPAN class="ft3">1.</SPAN><SPAN class="ft5">DEFINITIONS A. Parties</SPAN></P>
                        <P class="p6 ft4"><SPAN class="ft3">"You" </SPAN>and <SPAN class="ft3">"your" </SPAN>refer to you, as a user of the Site. A <SPAN class="ft3">"user" </SPAN>is someone who accesses, browses, crawls, scrapes, or in any way uses the Site. <SPAN class="ft3">"We," "us," </SPAN>and <SPAN class="ft3">"our" </SPAN>refer to carepostcard.</P>
                        <P class="p7 ft3">B. Content</P>
                        <P class="p8 ft8"><SPAN class="ft7">"Content" </SPAN>means text, images, photos, audio, video, location data, and all other forms of data or communication. <SPAN class="ft7">"Your Content" </SPAN>means Content that you submit or transmit to, through, or in connection with the Site, such as ratings, reviews, compliments, messages, and information that you publicly display or displayed in your account profile. <SPAN class="ft7">"User Content" </SPAN>means Content that users submit or transmit to, through, or in connection with the Site. <SPAN class="ft7">"carepostcard</SPAN></P>
                        <P class="p9 ft10"><SPAN class="ft9">Content" </SPAN>means Content that we create and make available in connection with the Site. <SPAN class="ft9">"Third Party Content" </SPAN>means Content that originates from parties other than carepostcard or its users, which is made available in connection with the Site. <SPAN class="ft9">"Site Content" </SPAN>means all of the Content that is made available in connection with the Site, including Your Content, User Content, Third Party Content, and carepostcard Content.</P>
                        <P class="p10 ft3">2. CHANGES TO THE TERMS OF SERVICE</P>
                        <P class="p11 ft10">We may modify the Terms from time to time. The most current version of these Terms will be located <A href="http://carepostcard.com/"><SPAN class="ft11">here</SPAN></A>. You understand and agree that your access to or use of the Site is governed by the Terms effective at the time of your access to or use of the Site. If we make material changes to these Terms, we will notify you by email or by posting a notice on the Site prior to the effective date of the changes. We will also indicate at the top of this page the date that revisions were last made. You should revisit these Terms on a regular basis as revised versions will be binding on you. Any such modification will be effective upon our posting of new Terms. <SPAN class="ft9">You understand and agree that your continued access to or use of the Site after the effective date of modifications to the Terms indicates your acceptance of the modifications.</SPAN></P>
                        <P class="p12 ft6"><SPAN class="ft3">3.</SPAN><SPAN class="ft5">USING THE SITE A. Eligibility</SPAN></P>
                        <P class="p13 ft4">To access or use the Site, you must be 18 years or older and have the requisite power and authority to enter into these Terms. You may not access or use the Site if you are a competitor of</P>

                        <P class="p0 ft4">ours or if we have previously banned you from the Site or closed your account.</P>
                        <P class="p14 ft3">B. Permission to Use the Site</P>
                        <P class="p15 ft4">We grant you permission to use the Site subject to the restrictions in these Terms. Your use of the Site is at your own risk, including the risk that you might be exposed to Content that is offensive, indecent, inaccurate, objectionable, or otherwise inappropriate.</P>
                        <P class="p16 ft3">C. Site Availability</P>
                        <P class="p17 ft4">The Site may be modified, updated, interrupted, suspended or discontinued at any time without notice or liability.</P>
                        <P class="p18 ft3">D. User Accounts</P>
                        <P class="p19 ft10">You must create an account and provide certain information about yourself in order to use some of the features that are offered through the Site. You are responsible for maintaining the confidentiality of your account password. You are also responsible for all activities that occur in connection with your account. You agree to notify us immediately of any unauthorized use of your account. We reserve the right to close your account at any time for any or no reason.</P>
                        <P class="p20 ft4">Your account is for your personal, <NOBR>non-commercial</NOBR> use only. In creating it, we ask that you provide complete and accurate information about yourself to bolster your credibility as a contributor to the Site. You may not impersonate someone else (e.g., adopt the identity of a celebrity or your <NOBR>next-door</NOBR> neighbor), create or use an account for anyone other than yourself, provide an email address other than your own, or create multiple accounts. If you use a pseudonym, take care to note that others may still be able to identify you if, for example, you include identifying information in your reviews, use the same account information on other sites, or allow other sites to share information about you with carepostcard. Please read our <SPAN class="ft13">Privacy Policy</SPAN> for more information.</P>
                        <P class="p21 ft3">E. Communications from carepostcard</P>
                        <P class="p22 ft4">You agree to receive certain communications in connection with the Site. For example, you may receive a confirmation email after you submit your carepostcard.</P>
                        <P class="p23 ft3"><SPAN class="ft3">4.</SPAN><SPAN class="ft14">CONTENT</SPAN></P>
                        <P class="p24 ft3">A. Responsibility for Your Content</P>
                        <P class="p25 ft10">You alone are responsible for Your Content, and once published, it cannot always be withdrawn. You assume all risks associated with Your Content, including anyone's reliance on its quality, accuracy, or reliability, or any disclosure by you of information in Your Content that makes you personally identifiable. You represent that you own, or have the necessary permissions to use and authorize the use of Your Content as described herein. You may not imply that Your Content is in any way sponsored or endorsed by carepostcard.</P>
                        <P class="p26 ft10">You may expose yourself to liability if, for example, Your Content contains material that is false, intentionally misleading, or defamatory; violates any <NOBR>third-party</NOBR> right, including any copyright, trademark, patent, trade secret, moral right, privacy right, right of publicity, or any other intellectual property or proprietary right; contains material that is unlawful, including illegal hate speech or pornography; exploits or otherwise harms minors; or violates or advocates the violation of any law or regulation.</P>
                        <P class="p27 ft3">B. Our Right to Use Your Content</P>
                        <P class="p28 ft10">We may use Your Content in a number of different ways, including publicly displaying it, reformatting it, incorporating it into advertisements and other works, creating derivative works from it, promoting it, distributing it, and allowing others to do the same in connection with their own websites and media platforms (<SPAN class="ft9">"Other Media"</SPAN>). As such, you hereby irrevocably grant us</P>

                        <P class="p29 ft4"><NOBR>world-wide,</NOBR> perpetual, <NOBR>non-exclusive,</NOBR> <NOBR>royalty-free,</NOBR> assignable, sublicensable, transferable rights to use Your Content for any purpose. Please note that you also irrevocably grant the users of the Site and any Other Media the right to access Your Content in connection with their use of the Site and any Other Media. Finally, you irrevocably waive, and cause to be waived, against carepostcard and its users any claims and assertions of moral rights or attribution with respect to Your Content. By "use" we mean use, copy, publicly perform and display, reproduce, distribute, modify, translate, remove, analyze, commercialize, and prepare derivative works of Your Content.</P>
                        <P class="p30 ft3">C. Ownership</P>
                        <P class="p31 ft4">As between you and carepostcard, you own Your Content. We own the carepostcard Content, including but not limited to visual interfaces, interactive features, graphics, design, compilation, including, but not limited to, our compilation of User Content and other Site Content, computer code, products, software, aggregate user review ratings, and all other elements and components of the Site excluding Your Content, User Content and Third Party Content. We also own the copyrights, trademarks, service marks, trade names, and other intellectual and proprietary rights throughout the world (<SPAN class="ft3">"IP Rights"</SPAN>) associated with the carepostcard Content and the Site, which are protected by copyright, trade dress, patent, trademark laws and all other applicable intellectual and proprietary rights and laws. As such, you may not modify, reproduce, distribute, create derivative works or adaptations of, publicly display or in any way exploit any of the carepostcard Content in whole or in part except as expressly authorized by us. Except as expressly and unambiguously provided herein, we do not grant you any express or implied rights, and all rights in and to the Site and the carepostcard Content are retained by us.</P>
                        <P class="p32 ft3">D. Advertising</P>
                        <P class="p33 ft4">carepostcard and its licensees may publicly display advertisements and other information adjacent to or included with Your Content. You are not entitled to any compensation for such advertisements. The manner, mode and extent of such advertising are subject to change without specific notice to you.</P>
                        <P class="p34 ft3">E. Other</P>
                        <P class="p35 ft10">User Content (including any that may have been created by users employed or contracted by carepostcard) does not necessarily reflect the opinion of carepostcard. We reserve the right to remove, screen, edit, or reinstate User Content from time to time at our sole discretion for any reason or no reason, and without notice to you. For example, we may remove a review if we believe it violates our <SPAN class="ft15">Content Guidelines</SPAN>. We have no obligation to retain or provide you with copies of Your Content, nor do we guarantee any confidentiality with respect to Your Content.</P>
                        <P class="p36 ft3">5. RESTRICTIONS</P>
                        <P class="p37 ft4">We are under no obligation to enforce the Terms on your behalf against another user. While we encourage you to let us know if you believe another user has violated the Terms, we reserve the right to investigate and take appropriate action at our sole discretion.</P>
                        <P class="p38 ft3"><SPAN class="ft3">A.</SPAN><SPAN class="ft14">You agree not to, and will not assist, encourage, or enable others to use the Site to:</SPAN></P>
                        <P class="p39 ft4"><SPAN class="ft4">i.</SPAN><SPAN class="ft16">Violate our </SPAN><SPAN class="ft13">Content Guidelines</SPAN>, for example, by writing a fake or defamatory review, trading reviews with other businesses, or compensating someone or being compensated to write or remove a review;</P>
                        <P class="p40 ft4"><SPAN class="ft4">ii.</SPAN><SPAN class="ft16">Violate any third party's rights, including any breach of confidence, copyright, trademark, patent, trade secret, moral right, privacy right, right of publicity, or any other intellectual property or proprietary right;</SPAN></P>
                        <P class="p41 ft4"><SPAN class="ft4">iii.</SPAN><SPAN class="ft17">Threaten, stalk, harm, or harass others, or promote bigotry or discrimination;</SPAN></P>

                        <P class="p42 ft4"><SPAN class="ft4">iv.</SPAN><SPAN class="ft16">Promote a business or other commercial venture or event, or otherwise use the Site for commercial purposes, except as expressly permitted by carepostcard;</SPAN></P>
                        <P class="p43 ft4"><SPAN class="ft4">v.</SPAN><SPAN class="ft18">Send bulk emails, surveys, or other mass messaging, whether commercial in nature or not; engage in keyword spamming, or otherwise attempt to manipulate the Site's search results or any third party website;</SPAN></P>
                        <P class="p41 ft4"><SPAN class="ft4">vi.</SPAN><SPAN class="ft16">Solicit personal information from minors, or submit or transmit pornography; or</SPAN></P>
                        <P class="p44 ft4"><SPAN class="ft4">vii.</SPAN><SPAN class="ft17">Violate any applicable law.</SPAN></P>
                        <P class="p14 ft3"><SPAN class="ft3">B.</SPAN><SPAN class="ft14">You also agree not to, and will not assist, encourage, or enable others to:</SPAN></P>
                        <P class="p45 ft4"><SPAN class="ft4">i.</SPAN><SPAN class="ft16">Violate the Terms;</SPAN></P>
                        <P class="p46 ft4"><SPAN class="ft4">ii.</SPAN><SPAN class="ft16">Modify, adapt, appropriate, reproduce, distribute, translate, create derivative works or adaptations of, publicly display, sell, trade, or in any way exploit the Site or Site Content (other than Your Content), except as expressly authorized by carepostcard;</SPAN></P>
                        <P class="p47 ft4"><SPAN class="ft4">iii.</SPAN><SPAN class="ft17">Use any robot, spider, site search/retrieval application, or other automated device, process or means to access, retrieve, scrape, or index any portion of the Site or any Site Content;</SPAN></P>
                        <P class="p41 ft4"><SPAN class="ft4">iv.</SPAN><SPAN class="ft16">Reverse engineer any portion of the Site;</SPAN></P>
                        <P class="p48 ft4"><SPAN class="ft4">v.</SPAN><SPAN class="ft18">Remove or modify any copyright, trademark or other proprietary rights notice that appears on any portion of the Site or on any materials printed or copied from the Site;</SPAN></P>
                        <P class="p41 ft4"><SPAN class="ft4">vi.</SPAN><SPAN class="ft16">Record, process, or mine information about other users;</SPAN></P>
                        <P class="p49 ft4"><SPAN class="ft4">vii.</SPAN><SPAN class="ft17">Access, retrieve or index any portion of the Site for purposes of constructing or populating a searchable database of business reviews;</SPAN></P>
                        <P class="p50 ft4"><SPAN class="ft4">viii.</SPAN><SPAN class="ft17">Reformat or frame any portion of the Site;</SPAN></P>
                        <P class="p51 ft4"><SPAN class="ft4">ix.</SPAN><SPAN class="ft16">Take any action that imposes, or may impose, in our sole discretion, an unreasonable or disproportionately large load on carepostcard's technology infrastructure or otherwise make excessive traffic demands of the Site;</SPAN></P>
                        <P class="p52 ft4"><SPAN class="ft4">x.</SPAN><SPAN class="ft18">Attempt to gain unauthorized access to the Site, user accounts, computer systems or networks connected to the Site through hacking, password mining or any other means;</SPAN></P>
                        <P class="p53 ft4"><SPAN class="ft4">xi.</SPAN><SPAN class="ft16">Use the Site or any Site Content to transmit any computer viruses, worms, defects, Trojan horses or other items of a destructive nature (collectively, </SPAN><SPAN class="ft3">"Viruses"</SPAN>);</P>
                        <P class="p54 ft4"><SPAN class="ft4">xii.</SPAN><SPAN class="ft17">Use any device, software or routine that interferes with the proper working of the Site, or otherwise attempt to interfere with the proper working of the Site;</SPAN></P>
                        <P class="p55 ft4"><SPAN class="ft4">xiii.</SPAN><SPAN class="ft17">Use the Site to violate the security of any computer network, crack passwords or security encryption codes; disrupt or interfere with the security of, or otherwise cause harm to, the Site or Site Content; or</SPAN></P>
                        <P class="p56 ft4"><SPAN class="ft4">xiv.</SPAN><SPAN class="ft16">Remove, circumvent, disable, damage or otherwise interfere with any security- related features of the Site, features that prevent or restrict the use or copying of Site Content, or features that enforce limitations on the use of the Site.</SPAN></P>
                        <P class="p57 ft4">The restrictions above only apply to the extent permissible under applicable law. Nevertheless, you agree not to act contrary to them (even if permissible under applicable law) without</P>

                        <P class="p58 ft4">providing 30 days' prior written notice to us, together with any information that we may reasonably require to give us an opportunity to provide alternative remedies or otherwise accommodate you at our sole discretion.</P>
                        <P class="p59 ft6"><SPAN class="ft3">6.</SPAN><SPAN class="ft5">GUIDELINES AND POLICIES A. Content Guidelines</SPAN></P>
                        <P class="p60 ft4">You represent that you have read and understood our <SPAN class="ft13">Content Guidelines</SPAN>.</P>
                        <P class="p61 ft3">B. Privacy</P>
                        <P class="p62 ft8">You represent that you have read and understood our <SPAN class="ft19">Privacy Policy</SPAN>. Note that we may disclose information about you to third parties if we have a good faith belief that such a disclosure is reasonably necessary to (i) take action regarding suspected illegal activities; (ii) enforce or apply our Terms and Privacy Policy; (iii) comply with legal process or other government inquiry, such as a search warrant, subpoena, statute, judicial proceeding, or other legal process served on us; or</P>
                        <P class="p63 ft4"><SPAN class="ft4">(iv)</SPAN><SPAN class="ft20">protect our rights, reputation, and property, or that of our users, affiliates, or the public. If you use the Site outside of the United States, you consent to having your personal data transferred to and processed in the United States.</SPAN></P>
                        <P class="p64 ft3"><SPAN class="ft3">C.</SPAN><SPAN class="ft14">Copyright And Trademark Disputes</SPAN></P>
                        <P class="p65 ft4">Please see our <SPAN class="ft13">Infringement Policy</SPAN> for information about copyright and trademark disputes.</P>
                        <P class="p23 ft3">7. SUGGESTIONS AND IMPROVEMENTS</P>
                        <P class="p66 ft10">By sending us any ideas, suggestions, documents or proposals (<SPAN class="ft9">"Feedback"</SPAN>), you agree that (i) your Feedback does not contain the confidential or proprietary information of third parties, (ii) we are under no obligation of confidentiality, express or implied, with respect to the Feedback,</P>
                        <P class="p67 ft10"><SPAN class="ft10">(iii)</SPAN><SPAN class="ft21">we may have something similar to the Feedback already under consideration or in development, and (iv) you grant us an irrevocable, </SPAN><NOBR>non-exclusive,</NOBR> <NOBR>royalty-free,</NOBR> perpetual, worldwide license to use, modify, prepare derivative works, publish, distribute and sublicense the Feedback, and you irrevocably waive, and cause to be waived, against carepostcard and its users any claims and assertions of any moral rights contained in such Feedback.</P>
                        <P class="p10 ft3"><SPAN class="ft3">8.</SPAN><SPAN class="ft14">THIRD PARTIES</SPAN></P>
                        <P class="p68 ft4">The Site may include links to other websites or applications (each, a <SPAN class="ft3">"Third Party Site"</SPAN>). We do not control or endorse any Third Party Site. You agree that we are not responsible for the availability or contents of such Third Party Sites. Your use of Third Party Sites is at your own risk.</P>
                        <P class="p69 ft4">Some of the services made available through the Site may be subject to additional third party or open source licensing terms and disclosures, which are incorporated herein by reference.</P>
                        <P class="p23 ft3">9. INDEMNITY</P>
                        <P class="p70 ft10">You agree to indemnify, defend, and hold carepostcard, its parents, subsidiaries, affiliates, any related companies, suppliers, licensors and partners, and the officers, directors, employees, agents and representatives of each of them (collectively, the "<SPAN class="ft9">carepostcard Entities</SPAN>") harmless, including costs, liabilities and legal fees, from any claim or demand made by any third party arising out of or relating to (i) your access to or use of the Site, (ii) your violation of the Terms,</P>
                        <P class="p71 ft10"><SPAN class="ft10">(iii)</SPAN><SPAN class="ft21">any products or services purchased or obtained by you in connection with the Site, or (iv) the infringement by you, or any third party using your account, of any intellectual property or other right of any person or entity. carepostcard reserves the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us and you agree to cooperate with our defense of these claims. You agree not to settle any such matter</SPAN></P>

                        <P class="p72 ft4">without the prior written consent of carepostcard. carepostcard will use reasonable efforts to notify you of any such claim, action or proceeding upon becoming aware of it.</P>
                        <P class="p73 ft3">10. DISCLAIMERS AND LIMITATIONS OF LIABILITY</P>
                        <P class="p74 ft3">PLEASE READ THIS SECTION CAREFULLY SINCE IT LIMITS THE LIABILITY OF THE CAREPOSTCARD ENTITIES TO YOU. EACH OF THE SUBSECTIONS BELOW ONLY APPLIES UP TO THE MAXIMUM EXTENT PERMITTED UNDER APPLICABLE LAW. NOTHING HEREIN IS INTENDED TO LIMIT ANY RIGHTS YOU MAY HAVE WHICH MAY NOT BE LAWFULLY LIMITED. IF YOU ARE UNSURE ABOUT THIS OR ANY OTHER SECTION OF THESE TERMS, PLEASE CONSULT WITH A LEGAL PROFESSIONAL PRIOR TO ACCESSING OR USING THE SITE. BY ACCESSING OR USING THE SITE, YOU REPRESENT THAT YOU HAVE READ, UNDERSTOOD, AND AGREE TO THESE TERMS, INCLUDING THIS SECTION. YOU ARE GIVING UP SUBSTANTIAL LEGAL RIGHTS BY AGREEING TO THESE TERMS.</P>
                        <P class="p75 ft4"><SPAN class="ft4">A.</SPAN><SPAN class="ft18">THE SITE IS MADE AVAILABLE TO YOU ON AN "AS IS", "WITH ALL FAULTS" AND "AS AVAILABLE" BASIS, WITH THE EXPRESS UNDERSTANDING THAT THE CAREPOSTCARD ENTITIES MAY NOT MONITOR, CONTROL, OR VET USER CONTENT. AS SUCH, YOUR USE OF THE SITE IS AT YOUR OWN DISCRETION AND RISK. THE CAREPOSTCARD ENTITIES MAKE NO CLAIMS OR PROMISES ABOUT THE QUALITY, ACCURACY, OR RELIABILITY OF THE SITE, ITS SAFETY OR SECURITY, OR THE SITE CONTENT. ACCORDINGLY, THE CAREPOSTCARD ENTITIES ARE NOT LIABLE TO YOU FOR ANY LOSS OR DAMAGE THAT MIGHT ARISE, FOR EXAMPLE, FROM THE SITE'S INOPERABILITY, UNAVAILABILITY OR SECURITY VULNERABILITIES OR FROM YOUR RELIANCE ON THE QUALITY, ACCURACY, OR RELIABILITY OF THE BUSINESS LISTINGS, RATINGS, REVIEWS (INCLUDING THEIR CONTENT, ORDER, AND DISPLAY), OR METRICS FOUND ON, USED ON, OR MADE AVAILABLE THROUGH THE SITE.</SPAN></P>
                        <P class="p76 ft4"><SPAN class="ft4">B.</SPAN><SPAN class="ft18">THE CAREPOSTCARD ENTITIES MAKE NO CLAIMS OR PROMISES WITH RESPECT TO ANY THIRD PARTY, SUCH AS THE BUSINESSES OR ADVERTISERS LISTED ON THE SITE OR THE SITE'S USERS. ACCORDINGLY, THE CAREPOSTCARD ENTITIES ARE NOT LIABLE TO YOU FOR ANY LOSS OR DAMAGE THAT MIGHT ARISE FROM THEIR ACTIONS OR OMISSIONS, INCLUDING, FOR EXAMPLE, IF ANOTHER USER OR BUSINESS MISUSES YOUR CONTENT, IDENTITY OR PERSONAL INFORMATION, OR IF YOU HAVE A NEGATIVE EXPERIENCE WITH ONE OF THE BUSINESSES OR ADVERTISERS LISTED OR FEATURED ON THE SITE. YOUR PURCHASE AND USE OF PRODUCTS OR SERVICES OFFERED BY THIRD PARTIES THROUGH THE SITE IS AT YOUR OWN DISCRETION AND RISK.</SPAN></P>
                        <P class="p77 ft10"><SPAN class="ft10">C.</SPAN><SPAN class="ft22">THE CAREPOSTCARD ENTITIES EXPRESSLY DISCLAIM ALL WARRANTIES, WHETHER EXPRESS OR IMPLIED, INCLUDING WARRANTIES AS TO THE PRODUCTS OR SERVICES OFFERED BY BUSINESSES LISTED ON THE SITE, AND IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON- INFRINGEMENT. NO ORAL OR WRITTEN INFORMATION OR ADVICE PROVIDED TO YOU BY A REPRESENTATIVE OF ONE OF THE CAREPOSTCARD ENTITIES SHALL CREATE A REPRESENTATION OR</SPAN></P>

                        <P class="p78 ft4">WARRANTY.</P>
                        <P class="p79 ft10"><SPAN class="ft10">D.</SPAN><SPAN class="ft22">YOUR SOLE AND EXCLUSIVE RIGHT AND REMEDY IN CASE OF DISSATISFACTION WITH THE SITE, RELATED SERVICES, OR ANY OTHER GRIEVANCE SHALL BE YOUR TERMINATION AND DISCONTINUATION OF ACCESS TO, OR USE OF THE SITE.</SPAN></P>
                        <P class="p80 ft8"><SPAN class="ft8">E.</SPAN><SPAN class="ft23">THE CAREPOSTCARD ENTITIES' MAXIMUM AGGREGATE LIABILITY TO YOU FOR LOSSES OR DAMAGES THAT YOU SUFFER IN CONNECTION WITH THE SITE OR THESE TERMS IS LIMITED TO THE GREATER OF (i)</SPAN></P>
                        <P class="p81 ft4">THE AMOUNT PAID, IF ANY, BY YOU TO THE CAREPOSTCARD ENTITIES IN CONNECTION WITH THE SITE IN THE 12 MONTHS PRIOR TO THE ACTION GIVING RISE TO LIABILITY, OR (ii) $1,000.</P>
                        <P class="p82 ft10"><SPAN class="ft10">F.</SPAN><SPAN class="ft22">THE CAREPOSTCARD ENTITIES DISCLAIM LIABILITY FOR ANY (i)</SPAN></P>
                        <P class="p83 ft4">INDIRECT, SPECIAL, INCIDENTAL, PUNITIVE, EXEMPLARY, RELIANCE, OR CONSEQUENTIAL DAMAGES, (ii) LOSS OF PROFITS, (iii) BUSINESS INTERRUPTION, (iv) REPUTATIONAL HARM, (v) LOSS OF INFORMATION OR DATA, or (vi)personal injury or wrongful death.</P>
                        <P class="p84 ft3"><SPAN class="ft3">1.</SPAN><SPAN class="ft14">CHOICE OF LAW AND VENUE</SPAN></P>
                        <P class="p85 ft10">Florida law will govern these Terms, as well as any claim, cause of action or dispute that might arise between you and carepostcard (a <SPAN class="ft9">"Claim"</SPAN>), without regard to conflict of law provisions.</P>
                        <P class="p86 ft4">FOR ANY CLAIM BROUGHT BY EITHER PARTY, YOU AGREE TO SUBMIT AND CONSENT TO THE PERSONAL AND EXCLUSIVE JURISDICTION IN, AND THE EXCLUSIVE VENUE OF, THE STATE AND FEDERAL COURTS LOCATED WITHIN vENTURA cOUNTY, CALIFORNIA.</P>
                        <P class="p87 ft3"><SPAN class="ft3">12.</SPAN><SPAN class="ft14">TERMINATION</SPAN></P>
                        <P class="p88 ft4"><SPAN class="ft4">A.</SPAN><SPAN class="ft18">You may terminate the Terms at any time by closing your account, discontinuing your use of the Site, and providing carepostcard with a notice of termination. Please review our </SPAN><SPAN class="ft13">Privacy Policy</SPAN> for information about what we do with your account when terminated.</P>
                        <P class="p89 ft4"><SPAN class="ft4">B.</SPAN><SPAN class="ft18">We may close your account, suspend your ability to use certain portions of the Site, and/or ban you altogether from the Site for any or no reason, and without notice or liability of any kind. Any such action could prevent you from accessing your account, the Site, Your Content, Site Content, or any other related information.</SPAN></P>
                        <P class="p90 ft4"><SPAN class="ft4">C.</SPAN><SPAN class="ft18">In the event of any termination of these Terms, whether by you or us, Sections 1, 4, 5, 9 - 13 will continue in full force and effect, including our right to use Your Content as detailed in Section 4.</SPAN></P>
                        <P class="p91 ft3"><SPAN class="ft3">13.</SPAN><SPAN class="ft14">GENERAL TERMS</SPAN></P>
                        <P class="p92 ft4"><SPAN class="ft4">A.</SPAN><SPAN class="ft18">We reserve the right to modify, update, or discontinue the Site at our sole discretion, at any time, for any or no reason, and without notice or liability.</SPAN></P>
                        <P class="p93 ft4"><SPAN class="ft4">B.</SPAN><SPAN class="ft18">We may provide you with notices, including those regarding changes to the Terms by email, regular mail or communications through the Site.</SPAN></P>
                        <P class="p94 ft4"><SPAN class="ft4">C.</SPAN><SPAN class="ft18">Except as otherwise stated in Section 9 above, nothing herein is intended, nor will be deemed, to confer rights or remedies upon any third party.</SPAN></P>
                        <P class="p95 ft4"><SPAN class="ft4">D.</SPAN><SPAN class="ft18">The Terms contain the entire agreement between you and us regarding the use of the Site, and supersede any prior agreement between you and us on such subject matter. The parties acknowledge that no reliance is placed on any representation made but not expressly contained in these Terms.</SPAN></P>

                        <P class="p96 ft4"><SPAN class="ft4">E.</SPAN><SPAN class="ft18">Any failure on carepostcard's part to exercise or enforce any right or provision of the Terms does not constitute a waiver of such right or provision. The failure of either party to exercise in any respect any right provided for herein shall not be deemed a waiver of any further rights hereunder.</SPAN></P>
                        <P class="p97 ft4"><SPAN class="ft4">F.</SPAN><SPAN class="ft18">If any provision of the Terms is found to be unenforceable or invalid, then only that provision shall be modified to reflect the parties' intention or eliminated to the minimum extent necessary so that the Terms shall otherwise remain in full force and effect and enforceable.</SPAN></P>
                        <P class="p98 ft4"><SPAN class="ft4">G.</SPAN><SPAN class="ft18">The Terms, and any rights or obligations hereunder, are not assignable, transferable or sublicensable by you except with carepostcard's prior written consent, but may be assigned or transferred by us without restriction. Any attempted assignment by you shall violate these Terms and be void.</SPAN></P>
                        <P class="p99 ft4"><SPAN class="ft4">H.</SPAN><SPAN class="ft18">The section titles in the Terms are for convenience only and have no legal or contractual effect.</SPAN></P>
                        <P class="p100 ft2">Privacy Policy</P>
                        <P class="p101 ft3">Last Updated on May 5, 2017. This Privacy Policy is effective immediately for users registering accounts after that date and will become effective on June 5, 2017 for pre- existing users.</P>
                        <P class="p102 ft10">This Privacy Policy describes our policies on the collection, use, and disclosure of information about you in connection with your use of our services, including those offered through our websites, emails, and mobile applications (collectively, the <SPAN class="ft9">"Service"</SPAN>). The terms <SPAN class="ft9">"we"</SPAN>, <SPAN class="ft9">"us"</SPAN>, and <SPAN class="ft9">"carepostcard" </SPAN>refer to carepostcard, LLC, a Florida limited liability company headquartered in Woodland Hills, CA. When you use the Service, you consent to our collection, use, and disclosure of information about you as described in this Privacy Policy.</P>
                        <P class="p103 ft3">TABLE OF CONTENTS</P>
                        <P class="p104 ft26"><SPAN class="ft24">1.</SPAN><A href="http://carepostcard.com/write-postcard##information"><SPAN class="ft25">Information We Collect and How We Use It</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">2.</SPAN><A href="http://carepostcard.com/write-postcard##cookies"><SPAN class="ft25">Cookies</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">3.</SPAN><A href="http://carepostcard.com/write-postcard##third-parties"><SPAN class="ft25">Third Parties</SPAN></A></P>
                        <P class="p23 ft26"><SPAN class="ft24">4.</SPAN><A href="http://carepostcard.com/write-postcard##personal-data"><SPAN class="ft25">Controlling Your Personal Data</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">5.</SPAN><A href="http://carepostcard.com/write-postcard##children"><SPAN class="ft25">Children</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">6.</SPAN><A href="http://carepostcard.com/write-postcard##security"><SPAN class="ft25">Security</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">7.</SPAN><A href="http://carepostcard.com/write-postcard##contact-information"><SPAN class="ft25">Contact Information</SPAN></A></P>
                        <P class="p23 ft26"><SPAN class="ft24">8.</SPAN><A href="http://carepostcard.com/write-postcard##modifications"><SPAN class="ft25">Modifications to This Privacy Policy</SPAN></A></P>
                        <P class="p104 ft26"><SPAN class="ft24">9.</SPAN><A href="http://carepostcard.com/write-postcard##california-residents"><SPAN class="ft25">California Residents: Your California Privacy Rights</SPAN></A></P>
                        <P class="p65 ft3"><SPAN class="ft3">1.</SPAN><SPAN class="ft27">INFORMATION WE COLLECT AND HOW WE USE IT</SPAN></P>
                        <P class="p105 ft10">We may collect and store information about you when you use the Service. We use the information to fulfill your requests, provide the Service’s functionality, improve the Service’s quality, personalize your experience, track usage of the Service, provide feedback to third party businesses that are listed on the Service, display relevant advertising, market the Service, provide customer support, message you, back up our systems and allow for disaster recovery, enhance the security of the Service, and comply with legal obligations.</P>

                        <P class="p0 ft4">Among the information we collect, please note:</P>
                        <P class="p106 ft10"><SPAN class="ft9">a.</SPAN><SPAN class="ft28">Account Information: </SPAN>If you create an account on carepostcard, we may store and use your full name, email address, zip code, and other information you may provide with your account, such as your gender and birth date. Your first name and last initial, as well as any photo you submit through the registration process, will be publicly displayed as part of your account profile. If you believe that someone has created an unauthorized account depicting you or your likeness, you can request its removal by contacting us <A href="http://carepostcard.com/contact-us"><SPAN class="ft11">here</SPAN></A>.</P>
                        <P class="p107 ft10"><SPAN class="ft9">b.</SPAN><SPAN class="ft28">Public Content: </SPAN>The information that you contribute through the Service is intended for public consumption, including your reviews, tips, photos, videos, <NOBR>check-ins,</NOBR> comments, likes, posts, bookmarks, friends, lists, compliments, and account profile. We may display this information through the Service, share it with businesses, and further distribute it to a wider audience through third party sites and services.</P>
                        <P class="p108 ft4"><SPAN class="ft3">c.</SPAN><SPAN class="ft14">Contacts: </SPAN>You can invite your friends to join the Service by providing us with their contact information, or by allowing us to access your contacts from your computer, mobile device, or third party sites to select which friends you want to invite. If you allow us to access your contacts, we may transmit that information to carepostcard long enough to process your invitations.</P>
                        <P class="p109 ft10"><SPAN class="ft9">d.</SPAN><SPAN class="ft28">Transactional Information: </SPAN>If you initiate a transaction through the Service, such as a reservation or purchase, we may collect and store information about you, such as your name, phone number, address, email, and credit card information, as well as any other information you provide to us, in order to process your transaction, send communications about them to you, and populate forms for future transactions. When you submit credit card numbers, we encrypt that information using industry standard technology. If you write reviews about businesses with which you transact through the Service, we may publicly display the fact that you transacted with those businesses.</P>
                        <P class="p110 ft8"><SPAN class="ft29">e.</SPAN><SPAN class="ft30">Activity: </SPAN>We may store information about your use of the Service, such as your search activity, the pages you view, the date and time of your visit, businesses you call using our mobile applications, and reservations and purchases you make through the Service. We also may store information that your computer or mobile device provides to us in connection with your use of the Service, such as your browser type, type of computer or mobile device, browser language, IP address, mobile carrier, phone number, unique device identifier, advertising identifier, location (including geolocation, beacon based location, and GPS location), and requested and referring URLs. You may be able to disallow our use of certain location data through your device or browser settings, for example by disabling</P>
                        <P class="p111 ft4">“Location Services” for the carepostcard application in iOS privacy settings.</P>
                        <P class="p65 ft3"><SPAN class="ft3">2.</SPAN><SPAN class="ft27">COOKIES</SPAN></P>
                        <P class="p112 ft4">We, and third parties with whom we partner, may use cookies, web beacons, tags, scripts, local shared objects such as HTML5 and Flash (sometimes called "flash cookies"), advertising identifiers (including mobile identifiers such as Apple’s IDFA or Google’s Advertising ID) and similar technology (<SPAN class="ft3">"Cookies"</SPAN>) in connection with your use of the Service, third party websites, and mobile applications. Cookies may have unique identifiers, and reside, among other places, on your computer or mobile device, in emails we send to you, and on our web pages. Cookies may transmit information about you and your use of the Service, such as your browser type, search preferences, IP address, data relating to advertisements that have been displayed to you or that you have clicked on, and the date and time of your use. Cookies may be persistent or stored only during an individual session.</P>
                        <P class="p113 ft4">The purposes for which we use Cookies in the Service include:</P>
                        <P class="p114 ft3">Purpose Explanation</P>

                        <TABLE cellpadding=0 cellspacing=0 class="t1">
                            <TR>
                                <TD class="tr1 td2"><P class="p1 ft4">Processes</P></TD>
                                <TD class="tr1 td3"><P class="p1 ft4">Intended to make the Service work in the way you expect. For example, we</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr2 td2"><P class="p1 ft31">&nbsp;</P></TD>
                                <TD class="tr2 td3"><P class="p1 ft8">use a Cookie that tells us whether you have already signed up for an account.</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr3 td2"><P class="p1 ft4">Authentication,</P></TD>
                                <TD class="tr3 td3"><P class="p1 ft4">Intended to prevent fraud, protect your data from unauthorized parties, and</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft10">Security, and</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">comply with legal requirements. For example, we use Cookies to determine if</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr2 td2"><P class="p1 ft8">Compliance</P></TD>
                                <TD class="tr2 td3"><P class="p1 ft8">you are logged in.</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr5 td2"><P class="p1 ft4">Preferences</P></TD>
                                <TD class="tr5 td3"><P class="p1 ft4">Intended to remember information about how you prefer the Service to</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">behave and look. For example, we use a Cookie that tells us whether you have</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">declined to allow us to use your phone’s geolocation data.</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr5 td2"><P class="p1 ft4">Notifications</P></TD>
                                <TD class="tr5 td3"><P class="p1 ft4">Intended to allow or prevent notices of information or options that we think</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">could improve your use of the Service. For example, we use a Cookie that</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">stops us from showing you the signup notification if you have already seen it.</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr5 td2"><P class="p1 ft4">Advertising</P></TD>
                                <TD class="tr5 td3"><P class="p1 ft4">Intended to make advertising more relevant to users and more valuable to</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">advertisers. For example, we may use Cookies to serve you <NOBR>interest-based</NOBR> ads,</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">such as ads that are displayed to you based on your visits to other websites, or</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr2 td2"><P class="p1 ft31">&nbsp;</P></TD>
                                <TD class="tr2 td3"><P class="p1 ft8">to tell us if you have recently clicked on an ad.</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr3 td2"><P class="p1 ft4">Analytics</P></TD>
                                <TD class="tr3 td3"><P class="p1 ft4">Intended to help us understand how visitors use the Service. For example, we</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr4 td2"><P class="p1 ft32">&nbsp;</P></TD>
                                <TD class="tr4 td3"><P class="p1 ft10">use a Cookie that tells us how our search suggestions correlate to your</P></TD>
                            </TR>
                            <TR>
                                <TD class="tr6 td2"><P class="p1 ft33">&nbsp;</P></TD>
                                <TD class="tr6 td3"><P class="p1 ft4">interactions with the search page.</P></TD>
                            </TR>
                        </TABLE>
                        <P class="p115 ft4"><SPAN class="ft3">Managing Cookies: </SPAN>It may be possible to disable some (but not all) Cookies through your device or browser settings, but doing so may affect the functionality of the Service. The method for disabling Cookies may vary by device and browser, but can usually be found in preferences or security settings. For example, iOS and Android devices each have settings which are designed to limit forms of ad tracking. For flash cookies, you can manage your privacy settings by clicking <SPAN class="ft34">here</SPAN>. Please note that changing any of these settings does not prevent the display of all advertisements to you.</P>
                        <P class="p116 ft3">3. THIRD PARTIES</P>
                        <P class="p60 ft4">Third parties may receive information about you as follows:</P>
                        <P class="p117 ft4"><SPAN class="ft3">a.</SPAN><SPAN class="ft14">Advertisers: </SPAN>We may allow third parties to use Cookies through the Service to collect the same type of information for the same purposes as carepostcard does for itself. In doing so, carepostcard adheres to the Digital Advertising Alliance’s <NOBR>Self-Regulatory</NOBR> Principles for Online Behavioral Advertising. Third parties may be able to associate the information they collect with other information they have about you from other sources. We do not necessarily have access to or control over the Cookies they use, but you may be able to opt out of some of their practices by visiting the following links: <SPAN class="ft34">Network Advertising Initiative</SPAN>, <SPAN class="ft34">Omniture</SPAN>, <SPAN class="ft34">Digital Advertising Alliance </SPAN>and <SPAN class="ft34">PrivacyChoice</SPAN>. Please note that opting out does not prevent the display of all advertisements to you. Additionally, we may share <NOBR>non-personally</NOBR> identifiable information from or about you with third parties, such as location data, advertising identifiers, or a cryptographic hash of a common account identifier (such as an email address), to facilitate the display of targeted advertising. You may be able to limit our sharing of some of this information through your mobile device settings, as described in Section 2 above.</P>
                        <P class="p118 ft10"><SPAN class="ft9">b.</SPAN><SPAN class="ft28">Service Providers: </SPAN>We may rely on third party providers to support or provide some of the services that are available through the Service, such as appointment booking. We may also rely on third party providers to perform certain services for us in connection with your use of the Service, such as communications and hosting services, network security, technical and customer support, tracking and reporting functions, quality assurance testing, payment processing, our own marketing of the Service, and other functions. We may share information from or about you with these third party providers so that they can perform</P>

                        <P class="p119 ft10">their services or complete your requests. These third party providers may share information with us that they obtain from or about you in connection with providing their services or completing your requests. Third party providers may also share this information with their subsidiaries, joint ventures, or other companies under common control. Some of our web pages utilize framing techniques to serve content to you from our third party providers, while preserving the look and feel of the Service. In such cases, please note that the information you provide is being provided to the third party.</P>
                        <P class="p120 ft4"><SPAN class="ft3">c.</SPAN><SPAN class="ft14">Aggregate Information: </SPAN>We may share user information in the aggregate with third parties, such as advertisers and content distributors. For example, we may disclose the number of users that have been exposed to, or clicked on, advertisements.</P>
                        <P class="p121 ft4"><SPAN class="ft3">d.</SPAN><SPAN class="ft14">Business Transfers: </SPAN>We may share information from or about you with our parent companies, subsidiaries, joint ventures, or other companies under common control, in which case we will require them to honor this Privacy Policy. If another company acquires carepostcard or all or substantially all of our assets, that company will possess the same information, and will assume the rights and obligations with respect to that information as described in this Privacy Policy.</P>
                        <P class="p122 ft10"><SPAN class="ft29">e.</SPAN><SPAN class="ft28">Businesses on Carepostcard: </SPAN>We may share information from or about you (such as your age and gender), your devices, and your use of the Service (such as which businesses you bookmark or call) with businesses and/or providers listed on carepostcard. Keep in mind that businesses may see your Public Content (as defined in Section 1(b) above) and receive information about your transactions with them, regardless of your settings. Additionally, if you make a phone call to a business through or in connection with your use of the Service, we may share information about your call with the business that the business would have received had you called them directly, such as the date and time of your call and your phone number. You may be able to limit our ability to collect and share your phone number through your phone’s settings or phone service provider.</P>
                        <P class="p123 ft4"><SPAN class="ft3">f.</SPAN><SPAN class="ft14">Investigations: </SPAN>We may investigate and disclose information from or about you if we have a good faith belief that such investigation or disclosure (a) is reasonably necessary to comply with legal process and law enforcement instructions and orders, such as a search warrant, subpoena, statute, judicial proceeding, or other legal process served on us; (b) is helpful to prevent, investigate, or identify possible wrongdoing in connection with the Service; or (c) protects our rights, reputation, property, or that of our users, affiliates, or the public, such as disclosures in connection with our Consumer Alerts program. If you flag or otherwise complain to carepostcard about content through the Service, we may share the substance of your complaint with the contributor of that content in order to provide an opportunity for the contributor to respond.</P>
                        <P class="p124 ft4"><SPAN class="ft3">g.</SPAN><SPAN class="ft14">Links: </SPAN>The Service may contain links to unaffiliated third party services. Except as set forth herein, we do not share your personal information with them, and are not responsible for their privacy practices. We suggest you read the privacy policies on or applicable to all such third party services.</P>
                        <P class="p125 ft4"><SPAN class="ft3">h.</SPAN><SPAN class="ft14">Third Party Accounts: </SPAN>If you sign up for carepostcard using a third party service like Facebook, or link your carepostcard account to your account with a third party service like Facebook or Twitter, we may receive information about you from such third party service.</P>
                        <P class="p126 ft3"><SPAN class="ft3">4.</SPAN><SPAN class="ft27">CONTROLLING YOUR PERSONAL DATA</SPAN></P>
                        <P class="p33 ft4">Other users may be able to identify you, or associate you with your account, if you include personal information in the content you post publicly. You can reduce the risk of being personally identified by using the Service pseudonymously, though doing so could detract from the credibility of your contributions to the Service.</P>
                        <P class="p127 ft4">Please also note that the messages you send or receive using the Service are only private to the</P>

                        <P class="p128 ft4">extent that both you and the person you are communicating with keep them private. For example, if you send a message to another user, that user may choose to publicly post it. Also, carepostcard may access and disclose such messages in the course of investigations relating to use of the Service.</P>
                        <P class="p129 ft3">5. CHILDREN</P>
                        <P class="p130 ft10">The Service is intended for general audiences and is not directed to children under 13. We do not knowingly collect personal information from children under 13. If you become aware that a child has provided us with personal information without parental consent, please contact us <A href="http://carepostcard.com/contact-us"><SPAN class="ft11">here</SPAN></A>. If we become aware that a child under 13 has provided us with personal information without parental consent, we take steps to remove such information and terminate the child's account.</P>
                        <P class="p131 ft3">6. SECURITY</P>
                        <P class="p26 ft10">We follow generally accepted industry standards to protect the personal information submitted to us, both during transmission and once we receive it. However, no method of transmission over the Internet or via mobile device, or method of electronic storage, is 100% secure. Therefore, while we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.</P>
                        <P class="p131 ft3">7. CONTACT INFORMATION</P>
                        <P class="p26 ft4">If you believe that carepostcard has not adhered to this Privacy Policy, you may contact us online by <A href="http://carepostcard.com/contact-us"><SPAN class="ft26">clicking here</SPAN></A> or write to us at the following address:</P>
                        <P class="p132 ft4">carepostcard LLC</P>
                        <P class="p65 ft4">Attn: Data Privacy Manager</P>
                        <P class="p65 ft4">6316 Topanga Canyon Blvd</P>
                        <P class="p65 ft4">Suite 2140</P>
                        <P class="p60 ft4">Woodland Hills, CA 91367</P>
                        <P class="p65 ft4">United States of America</P>
                        <P class="p65 ft3">8. MODIFICATIONS TO THIS PRIVACY POLICY</P>
                        <P class="p133 ft4">We may revise this Privacy Policy from time to time. The most current version of the Privacy Policy will govern our collection, use, and disclosure of information about you and will be located <A href="http://carepostcard.com/"><SPAN class="ft26">here</SPAN></A>. If we make material changes to this Privacy Policy, we will notify you by email or by posting a notice on the Service prior to the effective date of the changes. By continuing to access or use the Service after those changes become effective, you agree to the revised Privacy Policy.</P>
                        <P class="p134 ft36"><SPAN class="ft3">9.</SPAN><SPAN class="ft27">CALIFORNIA RESIDENTS: </SPAN><A href="https://termsfeed.com/blog/your-california-privacy-rights"><SPAN class="ft35">YOUR CALIFORNIA PRIVACY RIGHTS</SPAN></A></P>
                        <P class="p135 ft10">carepostcard does not disclose your personal information to third parties for the purpose of directly marketing their services to you unless you first agree to such disclosure. If you have any questions regarding this policy, or would like to change your preferences, you may contact us at the address listed above in Section 8.</P>
                    {{--DD END--}}
                    </div>

                    <div class="term-condition" style="margin-top: 10px;">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" id="accept-check" required>
                                <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                            </label>
                        </div>
                        <p class="accept-text">I accept <a class="term-of-user">Terms of Service</a> and have
                            read the <a class="privacy-policy-button">Privacy policy</a>
                        </p>
                    </div>

                    <a href="javascript:void(0)" id="btnSave" class="submit-button buttonload" style="padding: 8px;"><i
                                style="display: none;" id="buttonloading" class="fa fa-spinner fa-spin"></i> Send</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="term-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Terms of Service</h4>
                </div>
                <div class="modal-body">
                    <p><a name="__DdeLink__384_791221019"></a> <font color="#333333"><font face="Times New Roman, serif"><font size="5"><b>Terms of Service</b></font></font></font></p>

                    <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Last Updated on May 5, 2017</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. These terms and conditions are effective immediately for those registering accounts after that date and will become effective June 5, 2017 for those with pre-existing accounts. </font></font></font></p>

                    <p> </p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">These terms and conditions (the </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Terms"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">) govern your access to and use of carepostcard’s websites and mobile applications that link to or reference these Terms (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Site"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">). By accessing or using the Site, you are agreeing to these Terms and concluding a legally binding contract with carepostcard, LLC a Florida limited liability corporation headquartered in Woodland Hills, CA (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"carepostcard"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">). Do not access or use the Site if you are unwilling or unable to be bound by the Terms.</font></font></font></p>

                    <ol>
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>DEFINITIONS</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Parties</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"You"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> and </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"your"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> refer to you, as a user of the Site. A </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"user"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> is someone who accesses, browses, crawls, scrapes, or in any way uses the Site. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"We,"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"us,"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> and </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"our"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> refer to carepostcard.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="2" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Content</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means text, images, photos, audio, video, location data, and all other forms of data or communication. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Your Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means Content that you submit or transmit to, through, or in connection with the Site, such as ratings, reviews, compliments, messages, and information that you publicly display or displayed in your account profile. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"User Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means Content that users submit or transmit to, through, or in connection with the Site. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"carepostcard Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means Content that we create and make available in connection with the Site. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Third Party Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means Content that originates from parties other than carepostcard or its users, which is made available in connection with the Site. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Site Content"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> means all of the Content that is made available in connection with the Site, including Your Content, User Content, Third Party Content, and carepostcard Content.</font></font></font></p>

                    <ol start="2">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>CHANGES TO THE TERMS OF SERVICE</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><a name="_GoBack"></a> <font color="#333333"><font face="Times New Roman, serif"><font size="3">We may modify the Terms from time to time. The most current version of these Terms will be located </font></font></font><a href="/"><font face="Times New Roman, serif"><font size="3"><u><font color="#0073bb">here</font></u></font></font></a><font face="Times New Roman, serif"><font size="3"><u><font color="#0073bb"><!-- Hyperlink to current page --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. You understand and agree that your access to or use of the Site is governed by the Terms effective at the time of your access to or use of the Site. If we make material changes to these Terms, we will notify you by email or by posting a notice on the Site prior to the effective date of the changes. We will also indicate at the top of this page the date that revisions were last made. You should revisit these Terms on a regular basis as revised versions will be binding on you. Any such modification will be effective upon our posting of new Terms. </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">You understand and agree that your continued access to or use of the Site after the effective date of modifications to the Terms indicates your acceptance of the modifications.</font></b></font></font></p>

                    <ol start="3">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>USING THE SITE</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Eligibility</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">To access or use the Site, you must be 18 <!-- This is generally the legal age at which one can enter into a contract.  -->years or older and have the requisite power and authority to enter into these Terms. You may not access or use the Site if you are a competitor of ours or if we have previously banned you from the Site or closed your account.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="2" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Permission to Use the Site</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We grant you permission to use the Site subject to the restrictions in these Terms. Your use of the Site is at your own risk, including the risk that you might be exposed to Content that is offensive, indecent, inaccurate, objectionable, or otherwise inappropriate.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="3" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Site Availability</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The Site may be modified, updated, interrupted, suspended or discontinued at any time without notice or liability.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="4" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>User Accounts</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You must create an account and provide certain information about yourself in order to use some of the features that are offered through the Site. You are responsible for maintaining the confidentiality of your account password. You are also responsible for all activities that occur in connection with your account. You agree to notify us immediately of any unauthorized use of your account. We reserve the right to close your account at any time for any or no reason.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Your account is for your personal, non-commercial use only. In creating it, we ask that you provide complete and accurate information about yourself to bolster your credibility as a contributor to the Site. You may not impersonate someone else (e.g., adopt the identity of a celebrity or your next-door neighbor), create or use an account for anyone other than yourself, provide an email address other than your own, or create multiple accounts. If you use a pseudonym, take care to note that others may still be able to identify you if, for example, you include identifying information in your reviews, use the same account information on other sites, or allow other sites to share information about you with carepostcard. Please read our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="privacy-policy"><font color="#0073bb">Privacy Policy<!-- Hyperlink to privacy policy --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> for more information.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="5" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Communications from carepostcard</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You agree to receive certain communications in connection with the Site. For example, you may receive a confirmation email after you submit your carepostcard.</font></font></font></p>

                    <ol start="4">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>CONTENT</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Responsibility for Your Content</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You alone are responsible for Your Content, and once published, it cannot always be withdrawn. You assume all risks associated with Your Content, including anyone's reliance on its quality, accuracy, or reliability, or any disclosure by you of information in Your Content that makes you personally identifiable. You represent that you own, or have the necessary permissions to use and authorize the use of Your Content as described herein. You may not imply that Your Content is in any way sponsored or endorsed by carepostcard.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You may expose yourself to liability if, for example, Your Content contains material that is false, intentionally misleading, or defamatory; violates any third-party right, including any copyright, trademark, patent, trade secret, moral right, privacy right, right of publicity, or any other intellectual property or proprietary right; contains material that is unlawful, including illegal hate speech or pornography; exploits or otherwise harms minors; or violates or advocates the violation of any law or regulation.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="2" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Our Right to Use Your Content</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We may use Your Content in a number of different ways, including publicly displaying it, reformatting it, incorporating it into advertisements and other works, creating derivative works from it, promoting it, distributing it, and allowing others to do the same in connection with their own websites and media platforms (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Other Media"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">). As such, you hereby irrevocably grant us world-wide, perpetual, non-exclusive, royalty-free, assignable, sublicensable, transferable rights to use Your Content for any purpose. Please note that you also irrevocably grant the users of the Site and any Other Media the right to access Your Content in connection with their use of the Site and any Other Media. Finally, you irrevocably waive, and cause to be waived, against carepostcard and its users any claims and assertions of moral rights or attribution with respect to Your Content. By "use" we mean use, copy, publicly perform and display, reproduce, distribute, modify, translate, remove, analyze, commercialize, and prepare derivative works of Your Content.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="3" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Ownership</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">As between you and carepostcard, you own Your Content. We own the carepostcard Content, including but not limited to visual interfaces, interactive features, graphics, design, compilation, including, but not limited to, our compilation of User Content and other Site Content, computer code, products, software, aggregate user review ratings, and all other elements and components of the Site excluding Your Content, User Content and Third Party Content. We also own the copyrights, trademarks, service marks, trade names, and other intellectual and proprietary rights throughout the world (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"IP Rights"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">) associated with the carepostcard Content and the Site, which are protected by copyright, trade dress, patent, trademark laws and all other applicable intellectual and proprietary rights and laws. As such, you may not modify, reproduce, distribute, create derivative works or adaptations of, publicly display or in any way exploit any of the carepostcard Content in whole or in part except as expressly authorized by us. Except as expressly and unambiguously provided herein, we do not grant you any express or implied rights, and all rights in and to the Site and the carepostcard Content are retained by us.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="4" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Advertising</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">carepostcard and its licensees may publicly display advertisements and other information adjacent to or included with Your Content. You are not entitled to any compensation for such advertisements. The manner, mode and extent of such advertising are subject to change without specific notice to you.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="5" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Other</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">User Content (including any that may have been created by users employed or contracted by carepostcard) does not necessarily reflect the opinion of carepostcard. We reserve the right to remove, screen, edit, or reinstate User Content from time to time at our sole discretion for any reason or no reason, and without notice to you. For example, we may remove a review if we believe it violates our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="content-guidelines"><font color="#0073bb">Content Guidelines<!-- Hyperlink to Content Guidelines here --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. We have no obligation to retain or provide you with copies of Your Content, nor do we guarantee any confidentiality with respect to Your Content.</font></font></font></p>

                    <ol start="5">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>RESTRICTIONS</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We are under no obligation to enforce the Terms on your behalf against another user. While we encourage you to let us know if you believe another user has violated the Terms, we reserve the right to investigate and take appropriate action at our sole discretion.</font></font></font></p>

                    <ol>
                        <li>
                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>You agree not to, and will not assist, encourage, or enable others to use the Site to:</b></font></font></font></p>

                                    <ol type="i">
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Violate our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="content-guidelines"><font color="#0073bb">Content Guidelines<!-- Hyperlink to Content Guidelines here --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">, for example, by writing a fake or defamatory review, trading reviews with other businesses, or compensating someone or being compensated to write or remove a review;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Violate any third party's rights, including any breach of confidence, copyright, trademark, patent, trade secret, moral right, privacy right, right of publicity, or any other intellectual property or proprietary right;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Threaten, stalk, harm, or harass others, or promote bigotry or discrimination;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Promote a business or other commercial venture or event, or otherwise use the Site for commercial purposes, except as expressly permitted by carepostcard;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Send bulk emails, surveys, or other mass messaging, whether commercial in nature or not; engage in keyword spamming, or otherwise attempt to manipulate the Site's search results or any third party website;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Solicit personal information from minors, or submit or transmit pornography; or</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Violate any applicable law.</font></font></font></p>
                                        </li>
                                    </ol>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>You also agree not to, and will not assist, encourage, or enable others to:</b></font></font></font></p>

                                    <ol type="i">
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Violate the Terms;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Modify, adapt, appropriate, reproduce, distribute, translate, create derivative works or adaptations of, publicly display, sell, trade, or in any way exploit the Site or Site Content (other than Your Content), except as expressly authorized by carepostcard;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Use any robot, spider, site search/retrieval application, or other automated device, process or means to access, retrieve, scrape, or index any portion of the Site or any Site Content;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Reverse engineer any portion of the Site;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Remove or modify any copyright, trademark or other proprietary rights notice that appears on any portion of the Site or on any materials printed or copied from the Site;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Record, process, or mine information about other users;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Access, retrieve or index any portion of the Site for purposes of constructing or populating a searchable database of business reviews;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Reformat or frame any portion of the Site;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Take any action that imposes, or may impose, in our sole discretion, an unreasonable or disproportionately large load on carepostcard's technology infrastructure or otherwise make excessive traffic demands of the Site;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Attempt to gain unauthorized access to the Site, user accounts, computer systems or networks connected to the Site through hacking, password mining or any other means;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Use the Site or any Site Content to transmit any computer viruses, worms, defects, Trojan horses or other items of a destructive nature (collectively, </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Viruses"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">);</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Use any device, software or routine that interferes with the proper working of the Site, or otherwise attempt to interfere with the proper working of the Site;</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Use the Site to violate the security of any computer network, crack passwords or security encryption codes; disrupt or interfere with the security of, or otherwise cause harm to, the Site or Site Content; or</font></font></font></p>
                                        </li>
                                        <li>
                                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Remove, circumvent, disable, damage or otherwise interfere with any security-related features of the Site, features that prevent or restrict the use or copying of Site Content, or features that enforce limitations on the use of the Site.</font></font></font></p>
                                        </li>
                                    </ol>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The restrictions above only apply to the extent permissible under applicable law. Nevertheless, you agree not to act contrary to them (even if permissible under applicable law) without providing 30 days' prior written notice to us, together with any information that we may reasonably require to give us an opportunity to provide alternative remedies or otherwise accommodate you at our sole discretion.</font></font></font></p>

                    <ol start="6">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>GUIDELINES AND POLICIES</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Content Guidelines</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You represent that you have read and understood our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="content-guidelines"><font color="#0073bb">Content Guidelines<!-- Hyperlink to content guidelines here --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="2" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Privacy</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You represent that you have read and understood our </font></font></font><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><u class="privacy-policy">Privacy Policy</u></font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. <!-- Hyperlink to content guidelines here -->Note that we may disclose information about you to third parties if we have a good faith belief that such a disclosure is reasonably necessary to (i) take action regarding suspected illegal activities; (ii) enforce or apply our Terms and Privacy Policy; (iii) comply with legal process or other government inquiry, such as a search warrant, subpoena, statute, judicial proceeding, or other legal process served on us; or (iv) protect our rights, reputation, and property, or that of our users, affiliates, or the public. If you use the Site outside of the United States, you consent to having your personal data transferred to and processed in the United States.</font></font></font></p>

                    <ol>
                        <li>
                            <ol start="3" type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Copyright And Trademark Disputes</b></font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Please see our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="infringement-policy"><font color="#0073bb">Infringement Policy<!-- Hyperlink to Infringement Policy here --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> for information about copyright and trademark disputes.</font></font></font></p>

                    <ol start="7">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>SUGGESTIONS AND IMPROVEMENTS</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">By sending us any ideas, suggestions, documents or proposals (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Feedback"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">), you agree that (i) your Feedback does not contain the confidential or proprietary information of third parties, (ii) we are under no obligation of confidentiality, express or implied, with respect to the Feedback, (iii) we may have something similar to the Feedback already under consideration or in development, and (iv) you grant us an irrevocable, non-exclusive, royalty-free, perpetual, worldwide license to use, modify, prepare derivative works, publish, distribute and sublicense the Feedback, and you irrevocably waive, and cause to be waived, against carepostcard and its users any claims and assertions of any moral rights contained in such Feedback.</font></font></font></p>

                    <ol start="8">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>THIRD PARTIES</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The Site may include links to other websites or applications (each, a </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Third Party Site"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">). We do not control or endorse any Third Party Site. You agree that we are not responsible for the availability or contents of such Third Party Sites. Your use of Third Party Sites is at your own risk.</font></font></font></p>

                    <p> </p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Some of the services made available through the Site may be subject to additional third party or open source licensing terms and disclosures, which are incorporated herein by reference.</font></font></font></p>

                    <ol start="9">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>INDEMNITY</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You agree to indemnify, defend, and hold carepostcard, its parents, subsidiaries, affiliates, any related companies, suppliers, licensors and partners, and the officers, directors, employees, agents and representatives of each of them (collectively, the "</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">carepostcard Entities</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">") harmless, including costs, liabilities and legal fees, from any claim or demand made by any third party arising out of or relating to (i) your access to or use of the Site, (ii) your violation of the Terms, (iii) any products or services purchased or obtained by you in connection with the Site, or (iv) the infringement by you, or any third party using your account, of any intellectual property or other right of any person or entity. carepostcard reserves the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us and you agree to cooperate with our defense of these claims. You agree not to settle any such matter without the prior written consent of carepostcard. carepostcard will use reasonable efforts to notify you of any such claim, action or proceeding upon becoming aware of it.</font></font></font></p>

                    <ol start="10">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>DISCLAIMERS AND LIMITATIONS OF LIABILITY</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">PLEASE READ THIS SECTION CAREFULLY SINCE IT LIMITS THE LIABILITY OF THE CAREPOSTCARD ENTITIES TO YOU. EACH OF THE SUBSECTIONS BELOW ONLY APPLIES UP TO THE MAXIMUM EXTENT PERMITTED UNDER APPLICABLE LAW. NOTHING HEREIN IS INTENDED TO LIMIT ANY RIGHTS YOU MAY HAVE WHICH MAY NOT BE LAWFULLY LIMITED. IF YOU ARE UNSURE ABOUT THIS OR ANY OTHER SECTION OF THESE TERMS, PLEASE CONSULT WITH A LEGAL PROFESSIONAL PRIOR TO ACCESSING OR USING THE SITE. BY ACCESSING OR USING THE SITE, YOU REPRESENT THAT YOU HAVE READ, UNDERSTOOD, AND AGREE TO THESE TERMS, INCLUDING THIS SECTION. YOU ARE GIVING UP SUBSTANTIAL LEGAL RIGHTS BY AGREEING TO THESE TERMS.</font></b></font></font></p>

                    <p> </p>

                    <ol>
                        <li>
                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">THE SITE IS MADE AVAILABLE TO YOU ON AN "AS IS", "WITH ALL FAULTS" AND "AS AVAILABLE" BASIS, WITH THE EXPRESS UNDERSTANDING THAT THE CAREPOSTCARD ENTITIES MAY NOT MONITOR, CONTROL, OR VET USER CONTENT. AS SUCH, YOUR USE OF THE SITE IS AT YOUR OWN DISCRETION AND RISK. THE CAREPOSTCARD ENTITIES MAKE NO CLAIMS OR PROMISES ABOUT THE QUALITY, ACCURACY, OR RELIABILITY OF THE SITE, ITS SAFETY OR SECURITY, OR THE SITE CONTENT. ACCORDINGLY, THE CAREPOSTCARD ENTITIES ARE NOT LIABLE TO YOU FOR ANY LOSS OR DAMAGE THAT MIGHT ARISE, FOR EXAMPLE, FROM THE SITE'S INOPERABILITY, UNAVAILABILITY OR SECURITY VULNERABILITIES OR FROM YOUR RELIANCE ON THE QUALITY, ACCURACY, OR RELIABILITY OF THE BUSINESS LISTINGS, RATINGS, REVIEWS (INCLUDING THEIR CONTENT, ORDER, AND DISPLAY), OR METRICS FOUND ON, USED ON, OR MADE AVAILABLE THROUGH THE SITE.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">THE CAREPOSTCARD ENTITIES MAKE NO CLAIMS OR PROMISES WITH RESPECT TO ANY THIRD PARTY, SUCH AS THE BUSINESSES OR ADVERTISERS LISTED ON THE SITE OR THE SITE'S USERS. ACCORDINGLY, THE CAREPOSTCARD ENTITIES ARE NOT LIABLE TO YOU FOR ANY LOSS OR DAMAGE THAT MIGHT ARISE FROM THEIR ACTIONS OR OMISSIONS, INCLUDING, FOR EXAMPLE, IF ANOTHER USER OR BUSINESS MISUSES YOUR CONTENT, IDENTITY OR PERSONAL INFORMATION, OR IF YOU HAVE A NEGATIVE EXPERIENCE WITH ONE OF THE BUSINESSES OR ADVERTISERS LISTED OR FEATURED ON THE SITE. YOUR PURCHASE AND USE OF PRODUCTS OR SERVICES OFFERED BY THIRD PARTIES THROUGH THE SITE IS AT YOUR OWN DISCRETION AND RISK.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">THE CAREPOSTCARD ENTITIES EXPRESSLY DISCLAIM ALL WARRANTIES, WHETHER EXPRESS OR IMPLIED, INCLUDING WARRANTIES AS TO THE PRODUCTS OR SERVICES OFFERED BY BUSINESSES LISTED ON THE SITE, AND IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. NO ORAL OR WRITTEN INFORMATION OR ADVICE PROVIDED TO YOU BY A REPRESENTATIVE OF ONE OF THE CAREPOSTCARD ENTITIES SHALL CREATE A REPRESENTATION OR WARRANTY.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">YOUR SOLE AND EXCLUSIVE RIGHT AND REMEDY IN CASE OF DISSATISFACTION WITH THE SITE, RELATED SERVICES, OR ANY OTHER GRIEVANCE SHALL BE YOUR TERMINATION AND DISCONTINUATION OF ACCESS TO, OR USE OF THE SITE.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">THE CAREPOSTCARD ENTITIES' MAXIMUM AGGREGATE LIABILITY TO YOU FOR LOSSES OR DAMAGES THAT YOU SUFFER IN CONNECTION WITH THE SITE OR THESE TERMS IS LIMITED TO THE GREATER OF (i) THE AMOUNT PAID, IF ANY, BY YOU TO THE CAREPOSTCARD ENTITIES IN CONNECTION WITH THE SITE IN THE 12 MONTHS PRIOR TO THE ACTION GIVING RISE TO LIABILITY, OR (ii) $1,000.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">THE CAREPOSTCARD ENTITIES DISCLAIM LIABILITY FOR ANY (i) INDIRECT, SPECIAL, INCIDENTAL, PUNITIVE, EXEMPLARY, RELIANCE, OR CONSEQUENTIAL DAMAGES, (ii) LOSS OF PROFITS, (iii) BUSINESS INTERRUPTION, (iv) REPUTATIONAL HARM, (v) LOSS OF INFORMATION OR DATA, </font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">or </font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">(vi) </font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">personal injury or wrongful death</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">.</font></font></font></p>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>CHOICE OF LAW AND VENUE</b></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Florida law will govern these Terms, as well as any claim, cause of action or dispute that might arise between you and carepostcard (a </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Claim"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">), without regard to conflict of law provisions. FOR ANY CLAIM BROUGHT BY EITHER PARTY, YOU AGREE TO SUBMIT AND CONSENT TO THE PERSONAL AND EXCLUSIVE JURISDICTION IN, AND THE EXCLUSIVE VENUE OF, THE STATE AND FEDERAL COURTS LOCATED WITHIN </font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">vENTURA cOUNTY, CALIFORNIA.</font></font></font></p>

                    <ol start="12">
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>TERMINATION</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">You may terminate the Terms at any time by closing your account, discontinuing your use of the Site, and providing carepostcard with a notice of termination. Please review our </font></font></font><font face="Times New Roman, serif"><font size="3"><u class="privacy-policy"><font color="#0073bb">Privacy Policy<!-- Link to privacy policy here --></font></u></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> for information about what we do with your account when terminated.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We may close your account, suspend your ability to use certain portions of the Site, and/or ban you altogether from the Site for any or no reason, and without notice or liability of any kind. Any such action could prevent you from accessing your account, the Site, Your Content, Site Content, or any other related information.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">In the event of any termination of these Terms, whether by you or us, Sections 1, 4, 5, 9 - 13 will continue in full force and effect, including our right to use Your Content as detailed in Section 4.</font></font></font></p>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>GENERAL TERMS</b></font></font></font></p>

                            <ol type="A">
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We reserve the right to modify, update, or discontinue the Site at our sole discretion, at any time, for any or no reason, and without notice or liability.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We may provide you with notices, including those regarding changes to the Terms by email, regular mail or communications through the Site.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Except as otherwise stated in Section 9 above, nothing herein is intended, nor will be deemed, to confer rights or remedies upon any third party.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The Terms contain the entire agreement between you and us regarding the use of the Site, and supersede any prior agreement between you and us on such subject matter. The parties acknowledge that no reliance is placed on any representation made but not expressly contained in these Terms.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Any failure on carepostcard's part to exercise or enforce any right or provision of the Terms does not constitute a waiver of such right or provision. The failure of either party to exercise in any respect any right provided for herein shall not be deemed a waiver of any further rights hereunder.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">If any provision of the Terms is found to be unenforceable or invalid, then only that provision shall be modified to reflect the parties' intention or eliminated to the minimum extent necessary so that the Terms shall otherwise remain in full force and effect and enforceable.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The Terms, and any rights or obligations hereunder, are not assignable, transferable or sublicensable by you except with carepostcard's prior written consent, but may be assigned or transferred by us without restriction. Any attempted assignment by you shall violate these Terms and be void.</font></font></font></p>
                                </li>
                                <li>
                                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The section titles in the Terms are for convenience only and have no legal or contractual effect.</font></font></font></p>
                                </li>
                            </ol>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Copyright © 2017 carepostcard LLC, 6316 Topanga Canyon Blvd, Suite 2140, Woodland Hills, CA 91367, U.S.A.</font></font></font></p>

                    <p><br />
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="privacy-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Privacy Policy</h4>
                </div>
                <div class="modal-body">
                    <h1><font color="#333333"><font face="Times New Roman, serif"><font size="5"><b>Privacy Policy</b></font></font></font></h1>

                    <p><font size="3"><font color="#333333"><b><font face="Times New Roman, serif">Last Updated on May 5, 2017.</font></b></font></font><font size="3"><font color="#333333"><font color="#333333"> This Privacy Policy is effective immediately for users registering accounts after that date and will become effective on June 5, 2017 for pre-existing users.</font></font></font></p>

                    <p> </p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">This Privacy Policy describes our policies on the collection, use, and disclosure of information about you in connection with your use of our services, including those offered through our websites, emails, and mobile applications (collectively, the </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Service"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">). The terms </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"we"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">, </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"us"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">, and </font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"carepostcard"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> refer to carepostcard, LLC, a Florida limited liability company headquartered in Woodland Hills, CA. When you use the Service, you consent to our collection, use, and disclosure of information about you as described in this Privacy Policy.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>TABLE OF CONTENTS</b></font></font></font></p>

                    <ol>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##information">Information We Collect and How We Use It</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##cookies">Cookies</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##third-parties">Third Parties</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##personal-data">Controlling Your Personal Data</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##children">Children</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##security">Security</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##contact-information">Contact Information</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##modifications">Modifications to This Privacy Policy</a></font></font></font></p>
                        </li>
                        <li>
                            <p><font color="#0073bb"><font face="Times New Roman, serif"><font size="3"><a href="##california-residents">California Residents: Your California Privacy Rights</a></font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>1. INFORMATION WE COLLECT AND H<a id="#information" name="#information"></a>OW WE USE IT</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We may collect and store information about you when you use the Service. We use the information to fulfill your requests, provide the Service’s functionality, improve the Service’s quality, personalize your experience, track usage of the Service, provide feedback to third party businesses that are listed on the Service, display relevant advertising, market the Service, provide customer support, message you, back up our systems and allow for disaster recovery, enhance the security of the Service, and comply with legal obligations.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Among the information we collect, please note:</font></font></font></p>

                    <ol type="a">
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Account Information:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> If you create an account on carepostcard, we may store and use your full name, email address, zip code, and other information you may provide with your account, such as your gender and birth date. Your first name and last initial, as well as any photo you submit through the registration process, will be publicly displayed as part of your account profile. If you believe that someone has created an unauthorized account depicting you or your likeness, you can request its removal by contacting us here.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Public Content:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> The information that you contribute through the Service is intended for public consumption, including your reviews, tips, photos, videos, check-ins, comments, likes, posts, bookmarks, friends, lists, compliments, and account profile. We may display this information through the Service, share it with businesses, and further distribute it to a wider audience through third party sites and services.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Contacts:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> You can invite your friends to join the Service by providing us with their contact information, or by allowing us to access your contacts from your computer, mobile device, or third party sites to select which friends you want to invite. If you allow us to access your contacts, we may transmit that information to carepostcard long enough to process your invitations.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Transactional Information:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> If you initiate a transaction through the Service, such as a reservation or purchase, we may collect and store information about you, such as your name, phone number, address, email, and credit card information, as well as any other information you provide to us, in order to process your transaction, send communications about them to you, and populate forms for future transactions. When you submit credit card numbers, we encrypt that information using industry standard technology. If you write reviews about businesses with which you transact through the Service, we may publicly display the fact that you transacted with those businesses.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Activity:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may store information about your use of the Service, such as your search activity, the pages you view, the date and time of your visit, businesses you call using our mobile applications, and reservations and purchases you make through the Service. We also may store information that your computer or mobile device provides to us in connection with your use of the Service, such as your browser type, type of computer or mobile device, browser language, IP address, mobile carrier, phone number, unique device identifier, advertising identifier, location (including geolocation, beacon based location, and GPS location), and requested and referring URLs. You may be able to disallow our use of certain location data through your device or browser settings, for example by disabling “Location Services” for the carepostcard application in iOS privacy settings.</font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>2. <a id="#cookies" name="#cookies"></a>COOKIES</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We, and third parties with whom we partner, may use cookies, web beacons, tags, scripts, local shared objects such as HTML5 and Flash (sometimes called "flash cookies"), advertising identifiers (including mobile identifiers such as Apple’s IDFA or Google’s Advertising ID) and similar technology (</font></font></font><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">"Cookies"</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">) in connection with your use of the Service, third party websites, and mobile applications. Cookies may have unique identifiers, and reside, among other places, on your computer or mobile device, in emails we send to you, and on our web pages. Cookies may transmit information about you and your use of the Service, such as your browser type, search preferences, IP address, data relating to advertisements that have been displayed to you or that you have clicked on, and the date and time of your use. Cookies may be persistent or stored only during an individual session.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The purposes for which we use Cookies in the Service include:</font></font></font></p>

                    <table bgcolor="#ffffff" cellpadding="11" cellspacing="0" width="683">
                        <thead>
                        <tr valign="bottom">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Purpose</b></font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>Explanation</b></font></font></font></p>
                            </td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Processes</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to make the Service work in the way you expect. For example, we use a Cookie that tells us whether you have already signed up for an account.</font></font></font></p>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Authentication, Security, and Compliance</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to prevent fraud, protect your data from unauthorized parties, and comply with legal requirements. For example, we use Cookies to determine if you are logged in.</font></font></font></p>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Preferences</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to remember information about how you prefer the Service to behave and look. For example, we use a Cookie that tells us whether you have declined to allow us to use your phone’s geolocation data.</font></font></font></p>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Notifications</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to allow or prevent notices of information or options that we think could improve your use of the Service. For example, we use a Cookie that stops us from showing you the signup notification if you have already seen it.</font></font></font></p>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Advertising</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to make advertising more relevant to users and more valuable to advertisers. For example, we may use Cookies to serve you interest-based ads, such as ads that are displayed to you based on your visits to other websites, or to tell us if you have recently clicked on an ad.</font></font></font></p>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td bgcolor="#ffffff" width="162">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Analytics</font></font></font></p>
                            </td>
                            <td bgcolor="#ffffff" width="477">
                                <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Intended to help us understand how visitors use the Service. For example, we use a Cookie that tells us how our search suggestions correlate to your interactions with the search page.</font></font></font></p>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <p> </p>

                    <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Managing Cookies:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> It may be possible to disable some (but not all) Cookies through your device or browser settings, but doing so may affect the functionality of the Service. The method for disabling Cookies may vary by device and browser, but can usually be found in preferences or security settings. For example, iOS and Android devices each have settings which are designed to limit forms of ad tracking. For flash cookies, you can manage your privacy settings by clicking </font></font></font><font face="Times New Roman, serif"><font size="3"><font color="#0073bb">here</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. Please note that changing any of these settings does not prevent the display of all advertisements to you.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>3. <a id="#third-parties" name="#third-parties"></a>THIRD PARTIES</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Third parties may receive information about you as follows:</font></font></font></p>

                    <ol type="a">
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Advertisers:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may allow third parties to use Cookies through the Service to collect the same type of information for the same purposes as carepostcard does for itself. In doing so, carepostcard adheres to the Digital Advertising Alliance’s Self-Regulatory Principles for Online Behavioral Advertising. Third parties may be able to associate the information they collect with other information they have about you from other sources. We do not necessarily have access to or control over the Cookies they use, but you may be able to opt out of some of their practices by visiting the following links: </font></font></font><font color="#0073bb"><font face="Times New Roman, serif"><font size="3">Network Advertising Initiative</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">, </font></font></font><font color="#0073bb"><font face="Times New Roman, serif"><font size="3">Omniture</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">, </font></font></font><font color="#0073bb"><font face="Times New Roman, serif"><font size="3">Digital Advertising Alliance</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> and </font></font></font><font color="#0073bb"><font face="Times New Roman, serif"><font size="3">PrivacyChoice</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. Please note that opting out does not prevent the display of all advertisements to you. Additionally, we may share non-personally identifiable information from or about you with third parties, such as location data, advertising identifiers, or a cryptographic hash of a common account identifier (such as an email address), to facilitate the display of targeted advertising. You may be able to limit our sharing of some of this information through your mobile device settings, as described in Section 2 above.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Service Providers:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may rely on third party providers to support or provide some of the services that are available through the Service, such as appointment booking. We may also rely on third party providers to perform certain services for us in connection with your use of the Service, such as communications and hosting services, network security, technical and customer support, tracking and reporting functions, quality assurance testing, payment processing, our own marketing of the Service, and other functions. We may share information from or about you with these third party providers so that they can perform their services or complete your requests. These third party providers may share information with us that they obtain from or about you in connection with providing their services or completing your requests. Third party providers may also share this information with their subsidiaries, joint ventures, or other companies under common control. Some of our web pages utilize framing techniques to serve content to you from our third party providers, while preserving the look and feel of the Service. In such cases, please note that the information you provide is being provided to the third party.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Aggregate Information:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may share user information in the aggregate with third parties, such as advertisers and content distributors. For example, we may disclose the number of users that have been exposed to, or clicked on, advertisements.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Business Transfers:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may share information from or about you with our parent companies, subsidiaries, joint ventures, or other companies under common control, in which case we will require them to honor this Privacy Policy. If another company acquires carepostcard or all or substantially all of our assets, that company will possess the same information, and will assume the rights and obligations with respect to that information as described in this Privacy Policy.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Businesses on Carepostcard:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may share information from or about you (such as your age and gender), your devices, and your use of the Service (such as which businesses you bookmark or call) with businesses and/or providers listed on carepostcard. Keep in mind that businesses may see your Public Content (as defined in Section 1(b) above) and receive information about your transactions with them, regardless of your settings. Additionally, if you make a phone call to a business through or in connection with your use of the Service, we may share information about your call with the business that the business would have received had you called them directly, such as the date and time of your call and your phone number. You may be able to limit our ability to collect and share your phone number through your phone’s settings or phone service provider.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Investigations:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> We may investigate and disclose information from or about you if we have a good faith belief that such investigation or disclosure (a) is reasonably necessary to comply with legal process and law enforcement instructions and orders, such as a search warrant, subpoena, statute, judicial proceeding, or other legal process served on us; (b) is helpful to prevent, investigate, or identify possible wrongdoing in connection with the Service; or (c) protects our rights, reputation, property, or that of our users, affiliates, or the public, such as disclosures in connection with our Consumer Alerts program. If you flag or otherwise complain to carepostcard about content through the Service, we may share the substance of your complaint with the contributor of that content in order to provide an opportunity for the contributor to respond.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Links:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> The Service may contain links to unaffiliated third party services. Except as set forth herein, we do not share your personal information with them, and are not responsible for their privacy practices. We suggest you read the privacy policies on or applicable to all such third party services.</font></font></font></p>
                        </li>
                        <li>
                            <p><font face="Times New Roman, serif"><font size="3"><b><font color="#333333">Third Party Accounts:</font></b></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> If you sign up for carepostcard using a third party service like Facebook, or link your carepostcard account to your account with a third party service like Facebook or Twitter, we may receive information about you from such third party service.</font></font></font></p>
                        </li>
                    </ol>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>4. <a id="#personal-data" name="#personal-data"></a>CONTROLLING YOUR PERSONAL DATA</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Other users may be able to identify you, or associate you with your account, if you include personal information in the content you post publicly. You can reduce the risk of being personally identified by using the Service pseudonymously, though doing so could detract from the credibility of your contributions to the Service.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Please also note that the messages you send or receive using the Service are only private to the extent that both you and the person you are communicating with keep them private. For example, if you send a message to another user, that user may choose to publicly post it. Also, carepostcard may access and disclose such messages in the course of investigations relating to use of the Service.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>5. <a id="#children" name="#children"></a>CHILDREN</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">The Service is intended for general audiences and is not directed to children under 13. We do not knowingly collect personal information from children under 13. If you become aware that a child has provided us with personal information without parental consent, please contact us </font></font></font><font face="Times New Roman, serif"><font size="3"><font color="#0073bb"><a href="http://dev.carepostcards.com/contact-us">here</a></font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. If we become aware that a child under 13 has provided us with personal information without parental consent, we take steps to remove such information and terminate the child's account.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>6.<a id="#security" name="#security"></a> SECURITY</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We follow generally accepted industry standards to protect the personal information submitted to us, both during transmission and once we receive it. However, no method of transmission over the Internet or via mobile device, or method of electronic storage, is 100% secure. Therefore, while we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>7. <a id="#contact-information" name="#contact-information"></a>CONTACT INFORMATION</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">If you believe that carepostcard has not adhered to this Privacy Policy, you may contact us online by </font></font></font><font face="Times New Roman, serif"><font size="3"><font color="#0073bb"><a href="http://dev.carepostcards.com/contact-us">clicking here</a></font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3"> or write to us at the following address:</font></font></font></p>

                    <p> </p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">carepostcard LLC<br />
                                    Attn: Data Privacy Manager<br />
                                    6316 Topanga Canyon Blvd</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Suite 2140</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">Woodland Hills, CA 91367<br />
                                    United States of America</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>8. <a id="#modifications" name="#modifications"></a>MODIFICATIONS TO THIS PRIVACY POLICY</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">We may revise this Privacy Policy from time to time. The most current version of the Privacy Policy will govern our collection, use, and disclosure of information about you and will be located </font></font></font><font face="Times New Roman, serif"><font size="3"><font color="#0073bb">here</font></font></font><font color="#333333"><font face="Times New Roman, serif"><font size="3">. If we make material changes to this Privacy Policy, we will notify you by email or by posting a notice on the Service prior to the effective date of the changes. By continuing to access or use the Service after those changes become effective, you agree to the revised Privacy Policy.</font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3"><b>9. <a id="#california-residents" name="#california-residents"></a>CALIFORNIA RESIDENTS: YOUR CALIFORNIA PRIVACY RIGHTS</b></font></font></font></p>

                    <p><font color="#333333"><font face="Times New Roman, serif"><font size="3">carepostcard does not disclose your personal information to third parties for the purpose of directly marketing their services to you unless you first agree to such disclosure. If you have any questions regarding this policy, or would like to change your preferences, you may contact us at the address listed above in Section 8.</font></font></font></p>
                </div>
            </div>
        </div>
    </div>
@stop
@section('page-script')
    $('#info').change(function () {
        if (this.checked) {
            $('.visiabled').fadeIn('slow');
            $('.text-name').attr('required', 'true');
        }
        else {
            $('.visiabled').fadeOut('slow');
            $('.text-name').removeAttr('required');
        }
    });
    $('.text-info').keypress(function validate(evt) {
        var theEvent = evt || window.event;
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
        var regex = /[0-9]|\./;
        if (!regex.test(key)) {
            theEvent.returnValue = false;
            if (theEvent.preventDefault) theEvent.preventDefault();
        }
    });
@append
